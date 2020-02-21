package org.collectionspace.qa.records;

/* Used to store information about fields in that class,
   such as selectors to use to operate on fields, labels,
   and values to add when filling in fields */

public class AdvancedSearch extends Record {

    public AdvancedSearch(){
    	dropDownMap.put("Field-based search", "csc-advancedSearch-step2-subheader2-andOr");
    	dropDownMap.put("record type",        "csc-advancedSearch-selectRecordType");

        fieldSelectorByLabel.put("Earliest Modified Date", "csc-conditioncheck-updatedAtStart");
        fieldSelectorByLabel.put("Keyword Search", "csc-advancedSearch-query");
        fieldSelectorByLabel.put("Latest Modified Date", "csc-conditioncheck-updatedAtEnd");
        fieldSelectorByLabel.put("Record last modified by", "csc-conditioncheck-updatedBy");

    }
}
