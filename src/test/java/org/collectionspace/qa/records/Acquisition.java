package org.collectionspace.qa.records;

public class Acquisition extends Record {

    public Acquisition(){
		fieldSelectorByLabel.put("Acquisition Reference Number",  "csc-acquisition-numberPatternChooser-reference-number");
		fieldSelectorByLabel.put("Accession Date", 				  "csc-acquisition-accessionDateGroup");
		fieldSelectorByLabel.put("Acquisition Authorizer date",   "csc-acquisition-acquisitionAuthorizerDate");
		fieldSelectorByLabel.put("Acquisition Date", 		 	  "csc-acquisitionDateGroup-acquisitionDateGroup");
		fieldSelectorByLabel.put("Transfer of Title Number", 	  "csc-acquisition-transfer-of-title-number");
		fieldSelectorByLabel.put("Group purchase price",	 	  "csc-acquisition-group-purchase-price-value");
		fieldSelectorByLabel.put("Object offer price",   	 	  "csc-acquisition-object-offer-price-value");
		fieldSelectorByLabel.put("Object purchaser offer price",  "csc-acquisition-object-purchase-offer-price-value");
		fieldSelectorByLabel.put("Object purchase price",         "csc-acquisition-object-purchase-price-value");
		fieldSelectorByLabel.put("Original Object purchase price","csc-acquisition-original-object-purchase-price-value");
		fieldSelectorByLabel.put("Acquisition Reason",			  "csc-acquisition-acquisition-reason");
		fieldSelectorByLabel.put("Acquisition Note",			  "csc-acquisition-acquisition-note");
		fieldSelectorByLabel.put("Acquisition Provisos",		  "csc-acquisition-acquisition-provisos");
		fieldSelectorByLabel.put("Value",						  "csc-acquisition-acquisitionFundingValue");
		fieldSelectorByLabel.put("Source Provisos",				  "csc-acquisition-acquisitionFundingSourceProvisos");
		fieldSelectorByLabel.put("Credit Line",					  "csc-acquisition-creditLine");
		fieldSelectorByLabel.put("Field collection event name",	  "csc-acquisition-fieldCollectionEventName");
        fieldSelectorByLabel.put("Earliest Accession Date",       "csc-acquisition-accessionDateGroupStart");
        fieldSelectorByLabel.put("Latest Accession Date",         "csc-acquisition-accessionDateGroupEnd");
        fieldSelectorByLabel.put("Earliest Acquisition Date",     "csc-acquisition-acquisitionDateGroupStart");
        fieldSelectorByLabel.put("Latest Acquisition Date",       "csc-acquisition-acquisitionDateGroupEnd");
        fieldSelectorByLabel.put("Record last modified by",       "csc-acquisition-updatedBy");
        fieldSelectorByLabel.put("Earliest/Single Acquisition Date Year",      "csc-structuredDate-dateEarliestSingleYear");
        fieldSelectorByLabel.put("Earliest/Single Acquisition Date Month",     "csc-structuredDate-dateEarliestSingleMonth");
        fieldSelectorByLabel.put("Earliest/Single Acquisition Date Day",       "csc-structuredDate-dateEarliestSingleDay");
        fieldSelectorByLabel.put("Earliest/Single Accession Date Year",        "csc-structuredDate-dateEarliestSingleYear");
        fieldSelectorByLabel.put("Earliest/Single Accession Date Month",       "csc-structuredDate-dateEarliestSingleMonth");
        fieldSelectorByLabel.put("Earliest/Single Accession Date Day",         "csc-structuredDate-dateEarliestSingleDay");


        dropDownMap.put("Acquisition Method",	        "csc-acquisition-acquisition-method");
        dropDownMap.put("Acquisition Funding Currency", "//*[@id=\"termList-5\"]");


		xpathMap.put("Acquisition Authorizer",		  "//*[@id=\"primaryTab\"]/div/div[3]/div[1]/div[2]/div[1]/div[1]/div[3]/div[2]/table/tbody/tr/td[1]/input[2]");
		xpathMap.put("Acquisition Source",            "//*[@name=\"primary-fields.acquisitionSources\"]/following-sibling::input[1]");
		xpathMap.put("Funding Source",				  "//*[@id=\"repeat::\"]/td[4]/input[2]");
		xpathMap.put("Search Acquisition source",     "//*[@name=\"primary-acquisitionSources\"]/following-sibling::input[1]");
		xpathMap.put("Search Funding source",         "//*[@id=\".csc-acquisition-acquisitionFunding\"]/input[2]");


    }
}
