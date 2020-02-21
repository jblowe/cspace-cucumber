package org.collectionspace.qa.records;

public class GeneralPages extends Record{
    public GeneralPages() {

    	fieldSelectorByLabel.put("Advanced Search",          "csc-searchBox-advancedSearch");
    	fieldSelectorByLabel.put("Save",                     "csc-save");
        fieldSelectorByLabel.put("Advanced Search search",   "csc-advancedSearch-searchButton");
        fieldSelectorByLabel.put("Record last modified by",  "csc-collection-object-updatedBy");
        fieldSelectorByLabel.put("Earliest Modified Date",   "csc-loanin-updatedAtStart");

    	xpathMap.put("Ok", "//input[@value=\"OK\"]");
        xpathMap.put("Delete", "//input[@value=\"Delete\"]");
    }
}
