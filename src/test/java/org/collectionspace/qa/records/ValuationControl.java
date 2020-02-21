package org.collectionspace.qa.records;

public class ValuationControl extends Record {

    public ValuationControl() {

      fieldSelectorByLabel.put("Amount", "csc-valuationcontrol-valueAmount");
      fieldSelectorByLabel.put("Currency", "csc-valuationcontrol-valueCurrency");
      fieldSelectorByLabel.put("Date", "csc-valuationcontrol-valueDate");
      fieldSelectorByLabel.put("Note", "csc-valuationcontrol-valueNote");
      fieldSelectorByLabel.put("Object Valuation Information", "csc-valuationcontrol-objectValuationInformation");
      fieldSelectorByLabel.put("Renewal Date", "csc-valuationcontrol-valueRenewalDate");
      fieldSelectorByLabel.put("Type", "csc-valuationcontrol-valueType");
      fieldSelectorByLabel.put("Valuation Control Reference Number", "csc-valuationcontrol-valuationcontrolRefNumber");


      xpathMap.put("Source", "//*[@id=\"primaryTab\"]/div/div[3]/div[2]/div[2]/div[2]/div[1]/div[2]/input[2]");

    }
}
