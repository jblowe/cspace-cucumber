package org.collectionspace.qa.utils;

import java.util.HashMap;

public class Pages {
    private HashMap<String, String> pageUrls = new HashMap<>();
    private HashMap<String, String> pageLoadedSelector = new HashMap<>();

    public Pages() {
        pageUrls.put("Group", "group.html");
        pageUrls.put("Person", "person.html?vocab=person");
        pageUrls.put("ULAN Person", "person.html?vocab=ulan_person");
        pageUrls.put("Find and Edit", "findedit.html");
        pageUrls.put("Administration", "administration.html");
        pageUrls.put("Advanced search", "advancedsearch.html");
        pageUrls.put("Home", "index.html");

        pageUrls.put("Create New", "createnew.html");
        pageLoadedSelector.put("Create New", "csc-createNew-createButton");

        pageUrls.put("My CollectionSpace","myCollectionSpace.html");
        pageLoadedSelector.put("My CollectionSpace","csc-myCollectionSpace-categoryHeader");

        pageUrls.put("Group", "group.html");
        pageUrls.put("Cataloging", "cataloging.html");
        pageUrls.put("Cataloging Inventory Template", "cataloging.html?template=inventory");
        pageUrls.put("Cataloging Photograph Template", "cataloging.html?template=photograph");
        pageUrls.put("Loan In","loanin.html");
        pageUrls.put("Loan Out","loanout.html");
        pageUrls.put("Acquisition", "acquisition.html");
        pageUrls.put("Location/Movement/Inventory", "movement.html");
        pageUrls.put("Exhibition", "exhibition.html");
        pageUrls.put("Object Exit", "objectexit.html");
        pageUrls.put("Intake", "intake.html");
        pageUrls.put("Intake Doorstep Donation Template", "intake.html?template=doorstopDonation");
        pageUrls.put("Condition Check", "conditioncheck.html");
        pageUrls.put("Valuation Control", "valuationcontrol.html");
        pageUrls.put("Media Handling", "media.html");
        pageUrls.put("Associated Concepts","concept.html?vocab=concept");
        pageUrls.put("Matrial Concepts", "concept.html?vocab=material_ca");
        pageUrls.put("Activity Concepts", "concept.html?vocab=activity");
        pageUrls.put("Local Persons", "person.html?vocab=person");
        pageUrls.put("ULAN Persons", "person.html?vocab=ulan_pa");
        pageUrls.put("Local Storage Locations", "location.html?vocab=location");
        pageUrls.put("Offsite Storage Locations", "location.html?vocab=offsite_sla");
        pageUrls.put("Local Organizations", "organization.html?vocab=organization");
        pageUrls.put("ULAN Organizations", "organization.html?vocab=ulan_oa");
        pageUrls.put("Local Places", "place.html?vocab=place");
        pageUrls.put("Thesaurus of Geographic Names (TGN) Places", "place.html?vocab=tgn_place");
        pageUrls.put("Local Works", "work.html?vocab=work");
        pageUrls.put("CONA Works", "work.html?vocab=cona_work");
        pageUrls.put("Local Citations", "citation.html?vocab=citation");
        pageUrls.put("WorldCat Citations", "citation.html?vocab=worldcat");

    }


    public String getPageUrls(String pageName) {
        return pageUrls.get(pageName);
    }
    public String getPageLoadedSelector(String pageName) {return pageLoadedSelector.get(pageName);}
}
