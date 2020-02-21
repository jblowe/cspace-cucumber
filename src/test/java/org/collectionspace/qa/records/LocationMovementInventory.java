package org.collectionspace.qa.records;

public class LocationMovementInventory extends Record {

    public LocationMovementInventory() {


      xpathMap.put("Current Location",         "//*[@id=\"primaryTab\"]/div/div[3]/div[1]/div[2]/div[2]/div/div[2]/table/tbody/tr/td[1]/input[2]");
      xpathMap.put("Contact",                  "//*[@id=\"primaryTab\"]/div/div[3]/div[2]/div[2]/div[1]/div[2]/div/div[2]/input[2]");
      xpathMap.put("Normal Location",          "//*[@id=\"primaryTab\"]/div/div[3]/div[1]/div[2]/div[1]/div[2]/div/div[2]/input[2]");
      xpathMap.put("Second Contact",           "//*[@id=\"fluid-id-5jxc7z9x-1204\"]/ul/li/input[3]"); // fix fluid id....

      // fieldSelectorByLabel.put("Contact", "csc-movement-movementContact"); // "Contact" in UI. Disambiguating name could be "Movement Contact"
      // fieldSelectorByLabel.put("Current Location", "csc-movement-currentLocation");
      fieldSelectorByLabel.put("First Note", "csc-movement-currentLocationNote"); // "Note" in UI. Disambiguating name could be "Current Location Note"
      fieldSelectorByLabel.put("Fitness", "csc-movement-currentLocationFitness");
      fieldSelectorByLabel.put("Inventory Action Required", "csc-movement-inventoryActionRequired");
      //fieldSelectorByLabel.put("Second Contact", "csc-movement-inventoryContact"); // "Contact" in UI. Disambiguating name could be "Inventory Contact"
      fieldSelectorByLabel.put("Inventory Date", "csc-movement-inventoryDate");
      fieldSelectorByLabel.put("Inventory Frequency", "csc-movement-frequencyForInventory");
      fieldSelectorByLabel.put("Inventory Information", "csc-movement-inventory");
      fieldSelectorByLabel.put("Location Date", "csc-movement-locationDate");
      fieldSelectorByLabel.put("Method", "csc-movement-movementMethod");
      fieldSelectorByLabel.put("Movement Information", "csc-movement-movementControlInformation");
      fieldSelectorByLabel.put("Next Inventory Date", "csc-movement-nextInventoryDate");
      // fieldSelectorByLabel.put("Normal Location", "csc-movement-normalLocation");
      fieldSelectorByLabel.put("Object Location Information", "csc-movement-locationMovementInformation");
      fieldSelectorByLabel.put("Planned removal date", "csc-movement-plannedRemovalDate");
      fieldSelectorByLabel.put("Reason for move", "csc-movement-reasonForMove");
      fieldSelectorByLabel.put("Reference Number", "csc-movement-movementReferenceNumber");
      fieldSelectorByLabel.put("Removal date", "csc-movement-removalDate");
      fieldSelectorByLabel.put("Second Note", "csc-movement-movementNote"); // "Note" in UI. Disambiguating name could be "Movement Note"
      fieldSelectorByLabel.put("Third Note", "csc-movement-inventoryNote"); // "Note" in UI. Disambiguating name could be "Inventory Note"


    }
}
