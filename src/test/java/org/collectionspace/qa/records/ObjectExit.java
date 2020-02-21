package org.collectionspace.qa.records;

public class ObjectExit extends Record {


    public ObjectExit(){


	xpathMap.put("Current Owner",           "//*[@id=\"primaryTab\"]/div/div[3]/div[2]/div[2]/div[1]/div/div[2]/input[2]");
    xpathMap.put("Current Owner Search",    "//*[@id=\"all-content\"]//div/div/div/div/div[4]/div/div/div/div/div[2]/div[2]/div/ul/li/input[3]");
    xpathMap.put("Depositor",               "//*[@id=\"primaryTab\"]/div/div[3]/div[2]/div[3]/div[1]/div/div[2]/input[2]");
    xpathMap.put("Depositor Search",        "//*[@id=\"all-content\"]/div/div[1]/div/div/div/div[2]/div[4]/div/div/div/div/div[3]/div[2]/div/ul/li/input[3]");

    fieldSelectorByLabel.put("Exit Date",                       "csc-objectexit-exitDateGroup");
    fieldSelectorByLabel.put("Earliest Exit Date",              "csc-objectexit-exitDateGroupStart");
    fieldSelectorByLabel.put("Latest Exit Date",                "csc-objectexit-exitDateGroupEnd");
    fieldSelectorByLabel.put("Earliest Modified Date",          "csc-objectexit-updatedAtStart");
    fieldSelectorByLabel.put("Earliest Modified Date",          "csc-objectexit-updatedAtEnd");
    fieldSelectorByLabel.put("Exit Method",                     "csc-objectexit-exitMethod");
    fieldSelectorByLabel.put("Exit Note",                       "csc-objectexit-exitNote");
    fieldSelectorByLabel.put("Exit Number",                     "csc-objectexit-exitNumber");
    fieldSelectorByLabel.put("Packing Note",                    "csc-objectexit-packingNote");
    fieldSelectorByLabel.put("Earliest/Single Date Year",       "csc-structuredDate-dateEarliestSingleYear");
    fieldSelectorByLabel.put("Earliest/Single Date Month",      "csc-structuredDate-dateEarliestSingleMonth");
    fieldSelectorByLabel.put("Earliest/Single Date Day",        "csc-structuredDate-dateEarliestSingleDay");
    fieldSelectorByLabel.put("Latest Date Year",                "csc-structuredDate-dateLatestYear");
    fieldSelectorByLabel.put("Latest Date Month",               "csc-structuredDate-dateLatestMonth");
    fieldSelectorByLabel.put("Latest Date Date",                "csc-structuredDate-dateLatestDay");
    fieldSelectorByLabel.put("Record last modified by",         "csc-objectexit-updatedBy");

    dropDownMap.put("Exit Method",  "csc-objectexit-exitMethods");
    dropDownMap.put("Exit Reason",  "csc-objectexit-exitReason");


    }
}
