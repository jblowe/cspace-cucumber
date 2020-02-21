 package org.collectionspace.qa.records;

public class LoanIn extends Record {


    public LoanIn(){
        fieldSelectorByLabel.put("Authorization Date",            "csc-loanIn-lendersAuthorizerDate");
        fieldSelectorByLabel.put("Borrower's Authorization Date", "csc-loanin-borrowersAuthorizationDate");
        fieldSelectorByLabel.put("Earliest Loan In Date",         "csc-loanin-loanInDateStart");
        fieldSelectorByLabel.put("Earliest Loan Return Date",     "csc-loanin-loanReturnDateStart");
        fieldSelectorByLabel.put("Latest Loan In Date",           "csc-loanin-loanInDateEnd");
        fieldSelectorByLabel.put("Latest Loan Return Date",       "csc-loanin-loanReturnDateEnd");
        fieldSelectorByLabel.put("Loan In Conditions",            "csc-loanIn-loanInNote");
        fieldSelectorByLabel.put("Loan In Date",                  "csc-loanIn-loanInDate");
        fieldSelectorByLabel.put("Loan In Note",                  "csc-loanIn-loanInConditions");
        fieldSelectorByLabel.put("Loan In Number",                "csc-loanIn-loanInNumber");
        fieldSelectorByLabel.put("Loan Renewal Application Date", "csc-loanIn-loanRenewalApplicationDate");
        fieldSelectorByLabel.put("Loan Return Date",              "csc-loanIn-loanReturnDate");
        fieldSelectorByLabel.put("Loan Status Date",              "csc-loanin-loanStatusDate");
        fieldSelectorByLabel.put("Loan Status Note",              "csc-loanin-loanStatusNote");
        fieldSelectorByLabel.put("Earliest Loan Renewal Application Date", "csc-loanin-loanRenewalApplicationDateStart");
        fieldSelectorByLabel.put("Latest Loan Renewal Application Date",   "csc-loanin-loanRenewalApplicationDateEnd");
        fieldSelectorByLabel.put("Record last modified by",                "csc-loanin-updatedBy");

        dropDownMap.put("Loan Purpose",                  "csc-loanIn-loanPurpose");


        xpathMap.put("Lender",                "//*[@id=\"repeat::-1\"]/td[2]/input[2]");
        xpathMap.put("Lender's Contact",      "//*[@id=\"repeat::-1\"]/td[3]/input[2]");
        xpathMap.put("Lender's Authorizer",   "//*[@id=\"repeat::-1\"]/td[4]/input[2]");
        xpathMap.put("Borrower's Contact",    "//*[@id=\"primaryTab\"]/div/div[3]/div[2]/div[4]/div/div[2]/table/tbody/tr/td[1]/input[2]");
        xpathMap.put("Borrower's Authorizer", "//*[@id=\"primaryTab\"]/div/div[3]/div[2]/div[4]/div/div[2]/table/tbody/tr/td[2]/input[2]");
        xpathMap.put("Lender Search",         "//*[@id=\".csc-loanin-lenderGroup\"]/input[2]");


    }
}
