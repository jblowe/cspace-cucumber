package org.collectionspace.qa.utils;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import java.util.ArrayList;
import org.openqa.selenium.Keys;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;

import org.collectionspace.qa.records.*;

import static org.openqa.selenium.support.ui.ExpectedConditions.*;
import org.openqa.selenium.support.ui.*;

public class Utilities {

    public static String LOGIN_PATH = "index.html";
    
    public static Config config = new Config();
    public static String USERNAME = config.getUsername();
    public static String PASSWORD = config.getPassword();

    public static void login(WebDriver driver, String baseURL){
        driver.get(baseURL + LOGIN_PATH);

        WebElement html = driver.findElement(By.tagName("html"));

        for (int i = 0; i != 4; i++){
            html.sendKeys(Keys.chord(Keys.COMMAND, Keys.SUBTRACT));
        }

        driver.findElement(By.className("csc-login-userId")).sendKeys(USERNAME);
        driver.findElement(By.className("csc-login-password")).sendKeys(PASSWORD);
        driver.findElement(By.className("csc-login-button")).click();
    }

    public static List<WebElement> findElementsWithTimeout(WebDriver driver, int timeoutSeconds, By by) {
		driver.manage().timeouts().implicitlyWait(timeoutSeconds, TimeUnit.SECONDS);
		List<WebElement> foundElements = driver.findElements(by);
		driver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);

		return foundElements;
	}

    /**
     * Fills an autocomplete field with a given value.
     *
     * @param driver                      The WebDriver instance we are working with
     * @param value                       The new value, or null to generate a non-empty value
     * @param autocompleteInputElement    The WebElement into which we are inputting the value
     */
    public static void fillAutocompleteField(WebDriver driver, WebElement autocompleteInputElement, String value) {

        if (autocompleteInputElement != null) {
            autocompleteInputElement.click();
            autocompleteInputElement.sendKeys(value);

            new WebDriverWait(driver, 10).until(
                            ExpectedConditions.visibilityOfElementLocated(By.className("cs-autocomplete-popup")));


            WebElement popupElement = driver.findElement(By.className("cs-autocomplete-popup"));
            WebElement matchesElement = popupElement.findElement(By.className("csc-autocomplete-Matches"));
            WebElement matchSpanElement = null;

            new WebDriverWait(driver, 10).until(
                            ExpectedConditions.visibilityOfElementLocated(By.className("cs-autocomplete-popup")));

            for (WebElement candidateMatchElement : matchesElement.findElements(By.tagName("li"))) {
                WebElement candidateMatchSpanElement = candidateMatchElement.findElement(By.tagName("span"));

                if (candidateMatchSpanElement.getText().equals(value)) {
                    matchSpanElement = candidateMatchSpanElement;
                    break;
                }
            }

            if (matchSpanElement != null) {
                // Click the value if found
                new WebDriverWait(driver, 10).until(
                                ExpectedConditions.visibilityOfElementLocated(By.className("cs-autocomplete-popup")));

                matchSpanElement.click();

            }
            else {
                // create a new authority item if one matching it does not already exist
                new WebDriverWait(driver, 10).until(
                                ExpectedConditions.visibilityOfElementLocated(By.className("cs-autocomplete-popup")));


                WebElement addToPanelElement = popupElement.findElement(By.className("csc-autocomplete-addToPanel"));
                WebElement firstAuthorityItem = addToPanelElement.findElement(By.tagName("li"));

                firstAuthorityItem.click();

                while(findElementsWithTimeout(driver, 0, By.className("cs-autocomplete-popup")).size() > 0) {
                    // Wait for the popup to close
                }
            }
        }
        else {
        }

    }





    public static void log(String str) {
        System.out.print(str);
    }

    /**
     * Builds the xpath to select the div of Record or Vocab type
     * on the Create New page. Useful for scoping searches for elements
     * contained in that div.
     *
     * @param type the type of record being tested.
     * @return a xpath string
     */
    public static String buildCreateNewRecordTypeXpath(String type){
        String xpath = "//span[@class='csc-createNew-recordLabel cs-createNew-recordLabel']";
        xpath = xpath.concat("[text()='" + type + "']/ancestor::div[1]");
        return xpath;
    }

    /**
     *
     * @param driver webdriver object to access the browser
     * @param term the search term expected in the results
     * @return is it true or not
     */
    public static Boolean isInSearchResults(WebDriver driver, String term, Integer pageCounter) {
        Boolean result = Boolean.FALSE;
        String xpath = "//tr[@class='csc-row']/td/a[text()='" + term +"']";
        String textTemplate;
        String currentPageIndicatorFieldText;

        if (!driver.findElements(By.xpath(xpath)).isEmpty()) {
            result = Boolean.TRUE;
        } else {
            try {
                driver.findElement(By.className("flc-pager-next")).click();
                new WebDriverWait(driver, 10).until(
                                ExpectedConditions.invisibilityOfElementLocated(By.className("cs-loading-indicator")));

                pageCounter += 1;
                WebElement textField = driver.findElement(By.xpath("//*[@id=\"pager-bottom\"]/li[5]"));

                textTemplate = "Viewing page " + pageCounter + ".";
                currentPageIndicatorFieldText = textField.getText();

                if (!(currentPageIndicatorFieldText.contains(textTemplate))) {
                    return Boolean.FALSE; // fixes infinite loop of button-clicking when the item is not found.
                }
                result = isInSearchResults(driver, term, pageCounter);
            } catch (Exception e) { log(e.getMessage());}
        }
        return result;
    }

    /**
     * Fill in the required fields for a record type
     */
    public static void fillRequiredFieldsFor(String recordType, WebDriver driver) throws Exception{
        Record record = loadRecordOfType(recordType);
        Map<String, String> requiredMap = record.getRequiredMap();
        for (String required : requiredMap.keySet()){
            driver.findElement(By.id(required))
                    .sendKeys(generateTestFieldDataFor(recordType));
        }

    }

    /**
     * Generate unique test data for a field of a given type
     */
    public static String generateTestFieldDataFor(String recordType) {
        long timestamp = (new Date().getTime());
        return "required-" + recordType + "-" + timestamp;
    }

    /**
     * Finds an Element by either its class name or its xPath
     */
    public static WebElement findElementWithLabel(
                WebDriver driver, String recordType, String fieldName) throws Throwable {
        Record record;
        record = loadRecordOfType(recordType);
        String selector = record.getFieldSelectorByLabel(fieldName);
        WebElement element;
        if (selector == null) {
            selector = record.getXPath(fieldName);
            element = driver.findElement(By.xpath(selector));
        } else {
            selector = record.getFieldSelectorByLabel(fieldName);
            element = driver.findElement(By.className(selector));
        }
        return element;

    }

    /**
     * Fill in ann fields for a given record type.
     * Creates a new Record of the recordType, where fields are defined.
     */
    public static void fillInAllFieldsFor(String recordType, WebDriver driver) {
        try {
            Record record = loadRecordOfType(recordType);
            fillInFields(driver, record.getRequiredMap());
            fillInFields(driver, record.getFieldMap());
            updateSelectFields(driver, record.getSelectMap());
            fillInVocabFields(driver, record.getVocabMap());
            // TO DO ADD Dates and Checkboxes

        } catch (Exception e) { log(e.getMessage()); }
    }

    /**
     * Clears all fields except required fields
     */
    public static void clearAllFieldsFor(String recordType, WebDriver driver) {
        try {
            Record record = loadRecordOfType(recordType);
            clearFields(driver, record.getFieldMap());
            clearSelectFields(driver, record.getSelectMap());
            clearVocabFields(driver, record.getVocabMap());
            //TODO ADD Dates and Checkboxes

        } catch (Exception e) { log(e.getMessage()); }
    }

    /**
     * Verify that fields for a given Record have been filled in.
     * @param recordType the type of Record to check
     */
    public static void verifyAllFieldsFilledIn(String recordType,WebDriver driver){
        try {
            Record record = loadRecordOfType(recordType);
            verifyFieldsAreFilledIn(driver, record.getFieldMap());
            verifySelectFieldsUpdated(driver, record.getSelectMap());

        } catch (Exception e) { log(e.getMessage()); }
    }

    public static void verifyAllFieldsCleared(String recordType,WebDriver driver){
        try {
            Record record = loadRecordOfType(recordType);
            verifyFieldsAreCleared(driver, record.getFieldMap());
            verifySelectFieldsCleared(driver, record.getSelectMap());

        } catch (Exception e) { log(e.getMessage()); }
    }

    /**
     * Iterate over a Map to fill in field identified by field selector with value
     * @param fieldMap HashMap of fields for given Record type, providing
     *                 selectors and values.
     */
    public static void fillInFields(WebDriver driver, Map<String,String> fieldMap) {
        for (Map.Entry<String, String> field : fieldMap.entrySet()) {
            fillFieldLocatedById(field.getKey(), field.getValue(), driver);
        }
    }

    /**
     * Iterate over a Map to select an option from a '<select>' field by value
     * @param selectMap HashMap of '<select>' fields for given Record type, providing
     *                 selectors and values.
     */
    private static void updateSelectFields(WebDriver driver, Map<String, String> selectMap) {
        for (Map.Entry<String, String> field : selectMap.entrySet()) {
            updateSelectFieldLocatedByClass(field.getKey(), field.getValue(), driver);
        }
    }

    public static void fillInVocabFields(WebDriver driver, Map<String, String> vocabMap) {
        WebDriverWait wait = new WebDriverWait(driver, 10);
        for (Map.Entry<String, String> field : vocabMap.entrySet()) {
            fillVocabFieldLocatedByID(field.getKey(), field.getValue(), driver);

            WebElement autocomplete = wait.until(visibilityOfElementLocated(By.className("cs-autocomplete-popup")));
            String xpath = "//li[contains(@class, 'cs-autocomplete-matchItem')]/span[text()='" + field.getValue() + "']";
            List<WebElement> options = driver.findElements(By.xpath(xpath));
            if (!options.isEmpty()){
                options.get(0).click();
            } else {
                autocomplete.findElement(By.id("authorityItem:")).click();
            }
        }
    }

    public static void clearFields(WebDriver driver, Map<String, String> fieldMap) {
        for (Map.Entry<String, String> field : fieldMap.entrySet()) {
            clearFieldLocatedById(field.getKey(), field.getValue(), driver);
        }
    }

    public static void clearVocabFields(WebDriver driver, Map<String, String> vocabMap) {
        for (Map.Entry<String, String> field : vocabMap.entrySet()) {
            clearVocabFieldLocatedByID(field.getKey(), driver);
        }
    }

    public static void clearSelectFields(WebDriver driver, Map<String, String> selectMap) {
        for (Map.Entry<String, String> field : selectMap.entrySet()) {
            updateSelectFieldtoDefault(field.getKey(), driver);
        }
    }

    /**
     * Fill any field whose id contains the id with a value
     * @param id id of the field to be filled
     * @param value the value with which to fill in the field
     */
    public static void fillFieldLocatedById(String id, String value, WebDriver driver) {
        String xpath = "(//input|//textarea)[contains(@id, '"  + id + "')]";

        for (WebElement field : driver.findElements(By.xpath(xpath))) {
            field.sendKeys(value);
            new WebDriverWait(driver, 10)
                    .until(textToBePresentInElementValue(field, value));
        }
    }

    /**
     * Select an '<option>' in a all '<select>' containing @param selector in their id by its text
     * @param selector class partial of the field to be updated
     * @param visibleText the text of the option to select
     */
    private static void updateSelectFieldLocatedByClass(String selector, String visibleText, WebDriver driver) {
        String xpath = "(//select)[contains(@class, '"  + selector + "')]";
        for (WebElement element : driver.findElements(By.xpath(xpath))) {
            Select select = new Select(element);
            select.selectByVisibleText(visibleText);
            WebElement option = element.findElement(By.xpath("//option[text()='" + visibleText + "']"));
            new WebDriverWait(driver, 10)
                    .until(elementToBeSelected(option));
        }
    }

    public static void fillVocabFieldLocatedByID(String selector, String value, WebDriver driver) {
        WebDriverWait wait = new WebDriverWait(driver, 10);
        String xpath = "//div[@class='content']/input[contains(@id,'" + selector +"')]/following-sibling::input[@class='cs-autocomplete-input']";
        wait.until(visibilityOfElementLocated(By.xpath(xpath)));
        for (WebElement field : driver.findElements(By.xpath(xpath))) {
            field.sendKeys(value);
        }
    }

    public static void fillVocabFieldLocatedByIDAndSelectVocab(String selector, String value,
        String vocabName, WebDriver driver) {
        WebDriverWait wait = new WebDriverWait(driver, 10);
        String fieldXPath =
            "//div[@class='content']/input[contains(@id,'" + selector +"')]/following-sibling::input[@class='cs-autocomplete-input']";
        wait.until(visibilityOfElementLocated(By.xpath(fieldXPath)));
        WebElement field = driver.findElement(By.xpath(fieldXPath));
        field.sendKeys(value);
        WebElement autocompleteDropdown = wait.until(visibilityOfElementLocated(By.className("cs-autocomplete-popup")));
        String vocabXPath =
            "//div[contains(@class,'csc-autocomplete-addToPanel')]/descendant::li[@id='authorityItem:'][text()='" + vocabName + "']";
        WebElement vocabItem = driver.findElement(By.xpath(vocabXPath));
        vocabItem.click();
    }

    public static void clearFieldLocatedById(String id, String value, WebDriver driver) {
        String xpath = "(//input|//textarea)[contains(@id, '"  + id + "')]";

        for (WebElement field : driver.findElements(By.xpath(xpath))) {
            field.clear();
            new WebDriverWait(driver, 10)
                    .until(not(textToBePresentInElementValue(field, value)));
        }
    }

    private static void updateSelectFieldtoDefault(String selector, WebDriver driver) {
        String xpath = "(//select)[contains(@class, '"  + selector + "')]";
        for (WebElement element : driver.findElements(By.xpath(xpath))) {
            Select select = new Select(element);
            select.selectByIndex(0);
            new WebDriverWait(driver, 10)
                    .until(elementToBeSelected(select.getOptions().get(0)));
        }
    }

    public static void clearVocabFieldLocatedByID(String selector, WebDriver driver) {
        WebDriverWait wait = new WebDriverWait(driver, 10);
        String xpath= "//*[input[contains(@id,'" + selector +"')]]/input[@class='cs-autocomplete-input']";
        wait.until(visibilityOfElementLocated(By.xpath(xpath)));

        for (WebElement field : driver.findElements(By.xpath(xpath))) {
            field.clear();
        }
    }

    private static void verifySelectFieldsUpdated(WebDriver driver, Map<String, String> selectMap) {
        for (Map.Entry<String, String> select : selectMap.entrySet() ) {
            verifySelectFieldOptionSelected(select.getKey(), select.getValue(), driver);
        }
    }

    private static void verifySelectFieldOptionSelected(String selector, String expectedValue, WebDriver driver) {
        String xpath = "//select[contains(@class, '"  + selector + "')]";
        List<WebElement> selects = driver.findElements(By.xpath(xpath));
        for (WebElement element : selects) {
            Select select = new Select(element);
            assertTrue(
                    select.getFirstSelectedOption().getText().contains(expectedValue)
            );
        }
    }

    private static void verifySelectFieldsCleared(WebDriver driver, Map<String, String> selectMap) {
        for (Map.Entry<String, String> select : selectMap.entrySet() ) {
            verifySelectFieldIsDefault(select.getKey(), driver);
        }
    }

    private static void verifySelectFieldIsDefault(String selector, WebDriver driver) {
        String xpath = "//select[contains(@class, '"  + selector + "')]";
        for (WebElement element : driver.findElements(By.xpath(xpath))) {
            Select select = new Select(element);
            assertEquals(select.getFirstSelectedOption(), select.getOptions().get(0));
        }
    }

    /**
     * Iterate over a Map to verify each field from a record
     * @param fieldMap HashMap of fields for given Record type, providing
     *                 selectors and expected values.
     */
    public static void verifyFieldsAreFilledIn(WebDriver driver, Map<String, String> fieldMap) {
        for (Map.Entry<String, String> field : fieldMap.entrySet()) {
            verifyFieldLocatedByIDIsFilledIn(field.getKey(), field.getValue(), driver);
        }
    }

    /**
     * Iterate over a Map to verify each field from a record has been cleared
     * @param fieldMap HashMap of fields for given Record type, providing
     *                 selectors and expected values.
     */
    public static void verifyFieldsAreCleared(WebDriver driver, Map<String, String> fieldMap) {
        for (Map.Entry<String, String> field : fieldMap.entrySet()) {
            verifyFieldLocatedByIDIsFilledIn(field.getKey(), "" , driver);
        }
    }


    /**
     * Verify that all fields with id containing selector have been filled with the correct value
     * @param selector id of the field that should be filled in
     */
    public static void verifyFieldLocatedByIDIsFilledIn(String selector, String expectedValue, WebDriver driver) {
        String xpath = "(//input|//textarea)[contains(@id, '"  + selector + "')]";
        for (WebElement field : driver.findElements(By.xpath(xpath))) {
            assertTrue(field.getAttribute("value").contains(expectedValue));
        }
    }

    /**
     * Given a string name of a Record type, instantiate a new Object of that type and return it.
     * @param recordType the type of Record object to be created
     * @return an object of the type requested by recordType
     * @throws Exception if the record type is not known
     */
    public static Record loadRecordOfType(String recordType) throws Exception{
        Record record;
        switch (recordType) {
            case "Acquisition":
                record = new Acquisition();
                break;
            case "Administration":
                record = new Administration();
                break;
            case "AdvancedSearch":
                record = new AdvancedSearch();
                break;
            case "AdvancedSearchVocabulary":
                record = new AdvancedSearchVocabulary();
                break;
            case "Condition Check":
                record = new ConditionCheck();
                break;
            case "Cataloging":
                record = new Cataloging();
                break;
            case "Exhibition":
                record = new Exhibition();
                break;
            case "FCTenant":
                record = new FCTenant();
                break;
            case "Functionality":
                record = new Functionality();
                break;
            case "GeneralPages":
                record = new GeneralPages();
                break;
            case "Group":
                record = new Group();
                break;
            case "ImportExport":
                record = new ImportExport();
                break;
            case "Intake":
                record = new Intake();
                break;
            case "LifeSciTenant":
                record = new LifeSciTenant();
                break;
            case "Loan In":
                record = new LoanIn();
                break;
            case "Loan Out":
                record = new LoanOut();
                break;
            case "Location/Movement/Inventory":
                record = new LocationMovementInventory();
                break;
            case "Media Handling":
                record = new MediaHandling();
                break;
            case "Object Exit":
                record = new ObjectExit();
                break;
            case "Organization":
                record = new Organization();
                break;
            case "Person":
                record = new Person();
                break;
            case "Place":
                record = new Place();
                break;
            case "RecordsPrimaryTab":
                record = new RecordsPrimaryTab();
                break;
            case "RecordsSecondaryTab":
                record = new RecordsSecondaryTab();
                break;
            case "RightSideBar":
                record = new RightSideBar();
                break;
            case "SupplementarySecondary":
                record = new SupplementarySecondary();
                break;
            case "SupplementaryPrimary":
                record = new SupplementaryPrimary();
                break;
            case "Valuation Control":
                record = new ValuationControl();
                break;
            case "VocabularyTerms":
                record = new VocabularyTerms();
                break;
            default:
                throw new Exception(recordType + ": No classes of that Type known");
        }
        return record;
    }
}
