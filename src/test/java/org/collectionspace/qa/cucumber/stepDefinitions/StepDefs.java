package org.collectionspace.qa.cucumber.stepDefinitions;

import java.util.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.text.ParseException;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

import org.collectionspace.qa.utils.Config;
import org.collectionspace.qa.utils.Pages;
import org.collectionspace.qa.utils.ElementMappings;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.openqa.selenium.interactions.Actions;
import org.openqa.*;
import com.thoughtworks.selenium.*;
import static org.openqa.selenium.support.ui.ExpectedConditions.*;
import org.openqa.selenium.support.ui.*;
import org.openqa.selenium.JavascriptExecutor;


import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.collectionspace.qa.records.*;
import static org.collectionspace.qa.utils.Utilities.*;

public class StepDefs {

    private final WebDriver driver;
    private final WebDriverWait wait;
    private Record record;
    private Pages pages = new Pages();
    private Selenium selenium;
    private ElementMappings mappings = new ElementMappings();
    private SimpleDateFormat isoDateFormat = new SimpleDateFormat("yyyy-MM-dd");
    
    public static Config config = new Config();
    public static String BASE_URL = config.getBaseURL();

    public StepDefs() {
        driver = config.getBrowserDriver();
        wait = new WebDriverWait(driver, 10);
        driver.manage().window().maximize();

        login(driver, BASE_URL);

    }

    @And("^enters today's date in the \"([^\"]*)\" \"([^\"]*)\" field$")
    public void enters_todays_date_in_field(String recordType, String fieldName) throws Throwable {
        String date;
        Date dateNow = new Date();
        date = isoDateFormat.format(dateNow);

        try {
            enters_in_the_field(date, recordType, fieldName);
        } catch (Exception e) {
            System.out.print(e.getMessage());
        }


    }

    @And("^navigates to the record with identification number \"([^\"]*)\"$")
    public void go_to_record_with_id_number(String idNumber) throws Throwable {
        new WebDriverWait(driver, 10).until(
                        ExpectedConditions.invisibilityOfElementLocated(By.className("cs-loading-indicator")));

        enters_in_the_top_nav_search_field(idNumber);
        clicks_on_the_top_nav_search_submit_button();
        the_search_results_should_contain_results(idNumber);

        String xpath = "//tr[@class='csc-row']/td/a[text()='" + idNumber +"']";
        driver.findElement(By.xpath(xpath)).click();
        titlebar_should_contain(idNumber);
    }

    @And("^selects \"([^\"]*)\" from the \"([^\"]*)\" \"([^\"]*)\" dropdown$")
    public void selects_from_the_drop_down(String selector, String recordType, String dropdownName) throws Throwable {
        record = loadRecordOfType(recordType);
        String path  = record.getDropDownBox(dropdownName);
        Select select = new Select(driver.findElement(By.className(path)));
        select.selectByVisibleText(selector);
        new WebDriverWait(driver, 20).until(
                        ExpectedConditions.invisibilityOfElementLocated(By.className("cs-loading-indicator")));
    }


    @And("^(?:the user |user )?is on the \"([^\"]*)\" page$")
    public void is_on_page(String pageName) throws Throwable {
        driver.get(BASE_URL + pages.getPageUrls(pageName));
        wait.until(elementToBeClickable(
                By.className(pages.getPageLoadedSelector(pageName))));
    }

    @And("^(?:the user |user )?selects the \"([^\"]*)\" radio button(?: on the Create New page)?$")
    public void selects_the_radio_button(String radioButton) throws Throwable {
        WebElement radio = wait.until(visibilityOfElementLocated(By.xpath("//input[@value='" + radioButton.toLowerCase() + "']")));
        radio.click();
    }

    @And("^(?:a )?drop down list should appear in the \"([^\"]*)\" row$")
    public void drop_down_list_should_appear_in_the_create_new_row(String recordType) throws Throwable {
        String xpath = buildCreateNewRecordTypeXpath(recordType);
        WebElement row = wait.until(visibilityOfElementLocated(By.xpath(xpath)));
        assertFalse(row.findElements(By.tagName("select")).isEmpty());
    }

    @And("^(?:the )?list in the \"([^\"]*)\" row should contain \"([^\"]*)\"$")
    public void list_in_the_row_should_contain(String recordType, String optionsString) throws Throwable {
        String xpath = buildCreateNewRecordTypeXpath(recordType);
        WebElement row = driver.findElement(By.xpath(xpath));

        String[] options = optionsString.split(", ");
        for (String option : options){
            String optionXpath = "//select/option[contains(text(), '" + option +"')]";
           assertFalse(row.findElements(By.xpath(optionXpath)).isEmpty());
        }
    }

    @And("^(?:the )?titlebar should contain \"([^\"]*)\"$")
    public void titlebar_should_contain(String expectedText) throws Throwable {
        // assertTrue(wait.until(textToBePresentInElementLocated(By.id("title-bar"), expectedText)));
        wait.until(textToBePresentInElementLocated(
                By.className("csc-titleBar-value"), expectedText));
    }

    @And("^(?:the )?vocabulary (?:name )?in the titlebar should contain \"([^\"]*)\"$")
    public void titlebar_vocabulary_should_contain(String expectedText) throws Throwable {
        // assertTrue(wait.until(textToBePresentInElementLocated(By.id("title-bar"), expectedText)));
        wait.until(textToBePresentInElementLocated(
                By.className("csc-titleBar-vocab"), expectedText));
    }

    @And("^(?:the user |user )?clicks (?:on )?the Create button$")
    public void clicks_the_Create_button() throws Throwable {
        driver.findElement(By.id("createButton")).click();
        // Wait until the newly-created record's "Save" button appears
        // before proceeding, to avoid timeout errors
        wait.until(visibilityOfElementLocated(By.className("saveButton")));
    }

    @And("^(?:the user |user )?clicks (?:on )?the Save button$")
    public void clicks_the_Save_button() throws Throwable {
        driver.findElement(By.id("save")).click();
        // Wait until the newly-created record's "Save" button appears
        // before proceeding, to avoid timeout errors
        wait.until(visibilityOfElementLocated(By.className("saveButton")));
    }

    @And("^(?:the user |user )?is on a blank \"([^\"]*)\" record$")
    public void is_on_a_blank_of_type_record(String pageName) throws Throwable {
        driver.get(BASE_URL + pages.getPageUrls(pageName));
        // Wait until the newly-created record's "Save" button appears
        // before proceeding, to avoid timeout errors
        wait.until(visibilityOfElementLocated(By.className("saveButton")));
    }


    @And("^(?:the user |user )?enters \"([^\"]*)\" in the \"([^\"]*)\" \"([^\"]*)\" field$")
    public void enters_in_the_field(String value, String recordType , String fieldName) throws Throwable {
        String selector;
        WebElement element = findElementWithLabel(driver, recordType, fieldName);
        element.sendKeys(value);
        new WebDriverWait(driver, 10);
        // removes_focus_from_field(recordType, fieldName);
        // wait.until(textToBePresentInElement(element, value));
    }

    @And("^(?:the user |user )?enters \"([^\"]*)\" in the \"([^\"]*)\" \"([^\"]*)\" vocab field$")
    public void enters_in_the_vocab_field(String value, String recordType, String fieldName) throws Throwable {
        record = loadRecordOfType(recordType);
        String selector = record.getFieldSelectorByLabel(fieldName);
        fillVocabFieldLocatedByID(selector, value, driver);
    }

    @And("^(?:the user |user )?enters \"([^\"]*)\" in the \"([^\"]*)\" \"([^\"]*)\" vocab field and adds (?:it )to(?: the)? \"([^\"]*)\" vocab(?:ulary)?$")
    public void enters_in_the_vocab_field(String value, String recordType, String fieldName, String vocabName) throws Throwable {
        record = loadRecordOfType(recordType);
        String selector = record.getFieldSelectorByLabel(fieldName);
        fillVocabFieldLocatedByIDAndSelectVocab(selector, value, vocabName, driver);
    }

    @And("^(?:the )?record is successfully saved")
    public void record_is_successfully_saved() throws Throwable {
        wait.until(textToBePresentInElementLocated(
                By.className("cs-messageBar-message"), "successfully saved"));
    }

    @And("^\"([^\"]*)\" should be in the \"([^\"]*)\" \"([^\"]*)\" field$")
    public void should_be_in_the_field(String value, String recordType, String fieldName) throws Throwable {
        record = loadRecordOfType(recordType);
        String selector = record.getFieldSelectorByLabel(fieldName);
        verifyFieldLocatedByIDIsFilledIn(selector, value, driver);
    }

    @And("^\"([^\"]*)\" should be in the \"([^\"]*)\" \"([^\"]*)\" vocab field$")
    public void should_be_in_the_vocab_field(String value, String recordType, String fieldName) throws Throwable {
        record = loadRecordOfType(recordType);
        String selector = record.getFieldSelectorByLabel(fieldName);
        String xpath = "//*[input[contains(@name,'" + selector +"')]]/input[@class='cs-autocomplete-input']";
        WebElement field = wait.until(visibilityOfElementLocated(By.xpath(xpath)));
        assertEquals(field.getAttribute("value"), value);
    }

    @And("^(?:the user |user )?selects \"([^\"]*)\" from dropdown in \"([^\"]*)\" row$")
    public void selects_Person_from_dropdown_in_row(String templateType, String recordType) throws Throwable {
        String xpath = buildCreateNewRecordTypeXpath(recordType);
        WebElement row = wait.until(visibilityOfElementLocated(By.xpath(xpath)));
        Select select = new Select(row.findElement(By.tagName("select")));
        select.selectByVisibleText(templateType);
    }

    @And(("^close the browser$"))
    public void close_the_browser() {
        driver.close();
    }

    @And("^(?:the user |user )?enters \"([^\"]*)\" in the top nav search field$")
    public void enters_in_the_top_nav_search_field(String searchTerm) throws Throwable {
        String xpath = "//div[@class='csc-header-searchBox']/div/input[@type='text']";
        driver.findElement(By.xpath(xpath)).sendKeys(searchTerm);
    }

    @And("^(?:the user |user )?selects \"([^\"]*)\" from the top nav search record type select field$")
    public void selects_from_the_top_nav_record_type_select_field(String searchType) throws Throwable {
        String xpath = "//div[@class='csc-header-searchBox']/div/select[@name='recordTypeSelect-selection']";
        Select select = new Select(driver.findElement(By.xpath(xpath)));
        select.selectByVisibleText(searchType);
    }

    @And("^(?:the user |user )?selects \"([^\"]*)\" from the top nav search vocabulary select field$")
    public void selects_from_the_top_nav_vocab_type_select_field(String searchType) throws Throwable {
        String xpath = "//div[@class='csc-header-searchBox']/div/select[@name='selectVocab-selection']";
        WebElement vocab = wait.until(visibilityOfElementLocated(By.xpath(xpath)));
        Select vocabSelect = new Select(vocab);
        vocabSelect.selectByVisibleText(searchType);
    }

    @And("^(?:the user |user )?clicks on the top nav search submit button$")
    public void clicks_on_the_top_nav_search_submit_button() throws Throwable {
        String xpath = "//div[@class='csc-header-searchBox']/div/input[@type='button']";
        driver.findElement(By.xpath(xpath)).click();
    }

    @And("^(?:the )?search results should contain \"([^\"]*)\"$")
    public void the_search_results_should_contain_results(String results) throws Throwable {
        wait.until(visibilityOfElementLocated(
                By.xpath("(//tr[@class='csc-row']/td/a)[1]")));
        String[] options = results.split("; ");
        for (String option : options){
            driver.findElement(By.xpath("//*[@id=\"page-link:link1\"]")).click();
            assertTrue(isInSearchResults(driver, option, 1));
        }
    }

    @And("^(?:the )?search results should not contain \"([^\"]*)\"$")
    public void search_results_should_not_contain_results(String results) throws Throwable {
        try {
            wait.until(visibilityOfElementLocated(
                    By.xpath("(//tr[@class='csc-row']/td/a)[1]")));
        } catch(Exception e) {
            return;
        }

        String[] options = results.split("; ");
        for (String option : options){
            driver.findElement(By.xpath("//*[@id=\"page-link:link1\"]")).click();
            assertFalse(isInSearchResults(driver, option, 1));
        }
    }

    @And("^(?:the user |user )?clicks on result with text \"([^\"]*)\"$")
    public void clicks_on(String term) throws Throwable {
        String xpath = "(//tr[@class='csc-row']/td/a[text()='" + term +"'])[1]";
        driver.findElement(By.xpath(xpath)).click();
    }

    @And("^(?:the )?vocabulary autocomplete should contain \"([^\"]*)\"$")
    public void vocabulary_autocomplete_should_contain(String expected) throws Throwable {
        WebElement autocomplete = wait.until(visibilityOfElementLocated(By.className("cs-autocomplete-popup")));
        String[] options = expected.split("; ");
        for (String option : options){
            String xpath = "//li[@class='cs-autocomplete-matchItem csc-autocomplete-matchItem']/span[text()='" + option + "']";
            assertFalse(autocomplete.findElements(By.xpath(xpath)).isEmpty());
        }
    }

    @And("^(?:the user |user )?clicks (?:on )?the \"([^\"]*)\" button$")
    public void clicks_the_button(String button) throws Throwable {
        String recordType = "GeneralPages";
        WebElement elem = findElementWithLabel(driver, recordType, button);

        // Wait to make sure the loading page doesn't receive the click
        new WebDriverWait(driver, 10).until(
                        ExpectedConditions.invisibilityOfElementLocated(By.className("cs-loading-indicator")));

        elem.click();

        new WebDriverWait(driver, 10).until(
                        ExpectedConditions.invisibilityOfElementLocated(By.className("cs-loading-indicator")));

    }


    @When("^(?:the user |user )?clicks (?:on )?the \"([^\"]*)\" button on the \"([^\"]*)\" area to the right$")
    public void clicks_on_button_on_right(String button, String category) throws Throwable {
        String xpath = "//div[@class='csc-right-sidebar']//td/a[contains(text(), '" + button +"')]";
        if (category == "procedures")
            xpath = "//div[@class='csc-right-sidebar']//td/a[contains(text(), '" + button + "-2')]";
        driver.findElement(By.xpath(xpath)).click();
    }

    @And("^(?:the user |user )?fills in required fields for \"([^\"]*)\" record$")
    public void fills_in_required_fields_for_record(String recordType) throws Throwable {
        fillRequiredFieldsFor(recordType, driver);
    }


    @And("^enters \"([^\"]*)\" in the \"([^\"]*)\" \"([^\"]*)\" autocomplete field$")
    public void clicks_on_from_autocomplete_options(String value, String recordType, String fieldName) throws Throwable {

        try {
            WebElement element = findElementWithLabel(driver, recordType, fieldName);
            fillAutocompleteField(driver, element, value);
        } catch (Exception e) {
            log(e.getMessage());
        }


    }


    @And("^\"([^\"]*)\" should appear in the Terms Used sidebar$")
    public void should_appear_in_the_Terms_Used_sidebar(String term) throws Throwable {
        WebElement termsUsed = driver.findElement(By.className("csc-related-vocabularies"));
        // Check that at least one row is present in the Terms used section
        wait.until(visibilityOf(termsUsed.findElement(
                By.className("csc-listView-row"))));

        assertFalse(termsUsed.findElements(By.linkText(term)).isEmpty());

    }

    @And("^(?:the user |user )?clicks on \"([^\"]*)\" in Terms Used sidebar$")
    public void clicks_on_in_Terms_Used_sidebar(String term) throws Throwable {
       String xpath = "//div[@class='csc-related-record csc-related-vocabularies']//td/a[contains(text(), '" + term +"')]";
       driver.findElement(By.xpath(xpath)).click();
        wait.until(textToBePresentInElementLocated(
                By.className("csc-titleBar-value"), term));
    }

    @And("^(?:the )?error message bar should appear with \"([^\"]*)\"$")
    public void error_message_bar_should_appear_with(String errorMessage) throws Throwable {
        wait.until(visibilityOfElementLocated(By.className("cs-message-error")));
        assertTrue(driver.findElement(By.className("csc-messageBar-message"))
                .getText().equals(errorMessage));
    }

    @And("^(?:the user |user )?clicks OK to cancel error message$")
    public void clicks_OK_to_cancel_error_message() throws Throwable {
        driver.findElement(By.className("csc-messageBar-cancel")).click();
    }

    @And("^(?:the user |user )?removes focus from \"([^\"]*)\" \"([^\"]*)\" field$")
    public void removes_focus_from_field(String recordType, String fieldName) throws Throwable {
        record = loadRecordOfType(recordType);
        String selector = record.getFieldSelectorByLabel(fieldName);
        String xpath = "//input[contains(@id, '" + selector + "')]";
        driver.findElement(By.xpath(xpath)).sendKeys("\t");
    }

    // This needs to be made generic, rather than having a hard-coded 'name' attribute.
    // Also check on whether the step def below might instead fulfill this task.
    @And("^(?:the user |user )?clicks(?: on)? the plus to repeat the \"([^\"]*)\" form$")
    public void clicks_plus_to_repeat_form(String repeatedElement) throws Throwable {
        String xpath =
                "//input[@name='primary-fields.personTermGroup']/ancestor::div[1]/input[@type='button']";
        driver.findElement(By.xpath(xpath)).click();
    }

    // Note: code cobbled together from other stepdefs and untested
    @And("^(?:the user |user )?clicks(?: on)? the plus to repeat the \"([^\"]*)\" \"([^\"]*)\" field$")
    public void clicks_the_plus_to_repeat_the_field(String recordType, String fieldName) throws Throwable {
        record = loadRecordOfType(recordType);
        String selector = record.getFieldSelectorByLabel(fieldName);
        String xpath =
                "//input[contains(@id, '" + selector + "')]/ancestor::div[1]/input[@type='button']";
        driver.findElement(By.xpath(xpath)).click();
    }

    @And("^(?:an )?additional \"([^\"]*)\" record should be present$")
    public void additional_record_should_be_present(String repeatedElement) throws Throwable {
        List<WebElement> group = driver.findElements(By.name("primary-fields.personTermGroup"));
        assertTrue(group.size() > 1);
    }

    @And("^(?:the user |user )?adds \"([^\"]*)\" in the \"([^\"]*)\" field of the second \"([^\"]*)\" form$")
    public void adds_in_the_field_of_the_second_repeated_form(String term, String field,  String repeatedElement) throws Throwable {
        String xpath =
                "(//input[@name='primary-fields.personTermGroup'])[2]/ancestor::li//input[@class='csc-personAuthority-termDisplayName']";
        driver.findElement(By.xpath(xpath)).sendKeys(term);
    }

    @And("^(?:the user |user )?selects the additional \"([^\"]*)\" as primary$")
    public void selects_the_additional_as_primary(String repeatedElement) throws Throwable {
        String xpath =
                "(//input[@name='primary-fields.personTermGroup'])[2]/ancestor::li/input[contains(@class,'cs-repeatable-primary')]";
        driver.findElement(By.xpath(xpath)).click();
    }

    @And("^(?:the user |user )?fills in all the fields of the \"([^\"]*)\" record$")
    public void fills_in_all_fields(String recordType) throws Throwable {
        fillInAllFieldsFor(recordType, driver);
    }

    @And("^all fields in \"([^\"]*)\" record should be filled in$")
    public void all_fields_in_record_should_be_filled_in(String recordType) throws Throwable {
        // Express the Regexp above with the code you wish you had
        verifyAllFieldsFilledIn(recordType, driver);
    }

    // Clicks every '+' button
    @And("^(?:the user |user )?repeats all repeatable fields$")
    public void repeats_all_repeatable_fields() throws Throwable {
        String xpath = "//input[@type='button'][@value='+']";
        for (WebElement plus : driver.findElements(By.xpath(xpath))) {
            plus.click();
        }
    }

    @And("^(?:the user |user )?clears all fields of the \"([^\"]*)\" record$")
    public void clears_all_fields_of_the_record(String recordType) throws Throwable {
        clearAllFieldsFor(recordType, driver);
    }

    @And("^(?:the user |user )?clears the \"([^\"]*)\" \"([^\"]*)\" field$")
    public void clears_the_field(String recordType , String fieldName) throws Throwable {
        String selector;
        WebElement element = findElementWithLabel(driver, recordType, fieldName);
        element.clear();
        new WebDriverWait(driver, 10);
    }

    @And("^all fields of the \"([^\"]*)\" record should be empty$")
    public void all_fields_should_be_empty(String recordType) throws Throwable {
        verifyAllFieldsCleared(recordType, driver);
    }

    @And("^(?:the )?\"([^\"]*)\" button should not be clickable$")
    public void button_should_not_be_clickable(String button) throws Throwable {
        WebElement element = driver.findElement(By.className(button + "Button"));
        wait.until(not(elementToBeClickable(element)));
    }

    @And("^disables top and bottom \"([^\"]*)\" buttons$")
    public void top_bottom_buttons_should_not_be_clickable(String button) throws Throwable {
        String xpath = "//input[@type='button'][@id='" + button + "']";
        WebElement element = driver.findElement(By.xpath(xpath));
        wait.until(not(elementToBeClickable(element)));
        element = driver.findElement(By.xpath("//input[@type='button'][@id='" + button + "-1']"));
        wait.until(not(elementToBeClickable(element)));
    }

    @And("^enables top and bottom \"([^\"]*)\" buttons$")
    public void top_bottom_buttons_should_be_clickable(String button) throws Throwable {
        String xpath = "//input[@type='button'][@id='" + button + "']";
        WebElement element = driver.findElement(By.xpath(xpath));
        wait.until(elementToBeClickable(element));
        element = driver.findElement(By.xpath("//input[@type='button'][@id='" + button + "-1']"));
        wait.until(elementToBeClickable(element));
    }

    @And("^(?:the user |user )?clicks on the delete button$")
    public void clicks_on_the_delete_button() throws Throwable {
        driver.findElement(By.className("deleteButton")).click();
    }

    @And("^delete confirmation dialogue should appear$")
    public void delete_confirmation_dialogue_should_appear() throws Throwable {
        wait.until(visibilityOfElementLocated(By.className("csc-confirmationDialog")));
    }



    @And("^(?:the user |user )?clicks (?:the )?confirmation cancel button$")
    public void clicks_cancel_button() throws Throwable {
        driver.findElement(By.className("csc-confirmationDialogButton-cancel")).click();
    }

    @And("^(?:the user |user )?clicks (?:the )?confirmation close button$")
    public void clicks_close_button() throws Throwable {
        driver.findElement(By.className("csc-confirmationDialog-closeBtn")).click();
        //*[@id="fluid-id-ca7bipc2-1436"]/div/div/div[4]/input
    }

    @And("^(?:the user |user )?clicks (?:the )?confirmation delete button$")
    public void clicks_the_confirmation_delete_button() throws Throwable {
        driver.findElement(By.xpath("//*[@class=\"ui-dialog-content ui-widget-content\"]/div/div/div[3]/input[2]")).click();
    }


    @And("^(?:the user |user )?clicks (?:the )?confirmation don't save button$")
    public void clicks_the_confirmation_dont_save_button() throws Throwable {
        driver.findElement(By.className("csc-confirmationDialogButton-proceed")).click();
    }

    @And("^(?:the user |user )?clicks (?:the )?confirmation save button$")
    public void clicks_the_confirmation_save_button() throws Throwable {
        driver.findElement(By.className("csc-confirmationDialogButton-act")).click();
    }

    @And("^\"([^\"]*)\" deletion should be confirmed in a dialog$")
    public void deletion_should_be_confirmed_in_a_dialogue(String recordType) throws Throwable {
        WebElement element = wait.until(presenceOfElementLocated(By.className("csc-confirmationDialog-text")));
        assertTrue(element.getText().equals(recordType + " successfully deleted"));
    }

    @And("^(?:the user |user )?clicks delete confirmation OK button$")
    public void clicks_delete_confirmation_OK_button() throws Throwable {
        driver.findElement(By.className("csc-confirmationDialogButton-act")).click();
        wait.until(textToBePresentInElementLocated(By.className("header-name"), "Find and Edit"));
    }

    @And("^(?:the )?message \"([^\"]*)\" should be displayed$")
    public void message_should_be_displayed(String message) throws Throwable {
        WebElement element = wait.until(presenceOfElementLocated(By.className("content")));
        assertTrue(element.getText().equals(message));
    }

    @And("^(?:the user |user )?clicks Select number pattern$")
    public void clicks_select_number_pattern_button() throws Throwable {
        driver.findElement(By.className("csc-numberPatternChooser-button")).click();
    }

    @And("^(?:the user |user )?selects the \"([^\"]*)\" tab$")
    public void selects_the_tab(String tab) throws Throwable {
        String xpath = "//li[@class='csc-tabs-tab-link cs-tabs-tab-link']/span[text()='" + tab + "']";
        driver.findElement(By.xpath(xpath)).click();
    }

    @And("^\"([^\"]*)\" should be displayed in the message bar$")
    public void content_should_be_displayed_in_message_bar(String message) throws Throwable {
        WebElement element = wait.until(presenceOfElementLocated(By.className("csc-messageBar cs-messageBar")));
        assertTrue(element.getText().equals(message));
    }

    @And("(?:the user |user )?clicks on \"([^\"]*)\" in the Used By sidebar")
    public void clicks_on_term_in_the_used_by_sidebar(String term) throws Throwable {
        String xpath = "//div[@class='csc-related-record csc-related-nonVocabularies']//td/a[contains(text(), '" + term +"')]";
        driver.findElement(By.xpath(xpath)).click();
        wait.until(textToBePresentInElementLocated(
                By.className("csc-titleBar-value"), term));
    }

    @And("^(?:the user |user )?presses the Tab key$")
    public void presses_the_tab_key() throws Throwable {
        driver.switchTo().activeElement().sendKeys(Keys.TAB);
    }

    @And("^(?:the user |user )?presses the ESC key$")
    public void presses_the_esc_key() throws Throwable {
        driver.switchTo().activeElement().sendKeys(Keys.ESCAPE);
    }


    @And("^(?:the user |user )?presses the tab key until reaching the \"([^\"]*)\" button(?: )?(?:#.*)?$")
    public void presses_the_tab_key_until_reaching_button(String button) throws Throwable {
        WebElement destinationButton = driver.findElement(By.name(button));
        int k = 0;
        while (k < 500) {
            k++;
            if(driver.switchTo().activeElement().equals(destinationButton)) {
                break;
            }
            driver.switchTo().activeElement().sendKeys(Keys.TAB);
        }
        assertTrue(driver.switchTo().activeElement().equals(destinationButton));
    }
}
