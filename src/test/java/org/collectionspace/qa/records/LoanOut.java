package org.collectionspace.qa.records;

public class LoanOut extends Record {

    public LoanOut(){

		fieldSelectorByLabel.put("Borrower's Authorization Date", 		 "csc-loanout-borrowersAuthorizationDate");
		fieldSelectorByLabel.put("Loan Out Number", 					 "csc-loanOut-loanOutNumber");
		fieldSelectorByLabel.put("Lender's Authorization Date", 		 "csc-loanOut-lendersAuthorizationDate");
		fieldSelectorByLabel.put("Loan Out Conditions", 				 "csc-loanOut-loanOutConditions");
		fieldSelectorByLabel.put("Loan Out Note", 						 "csc-loanOut-loanOutNote");
		fieldSelectorByLabel.put("Loan Status Date", 					 "csc-loanOut-loanedObjectStatusDate");
		fieldSelectorByLabel.put("Loan Status Note", 					 "csc-loanOut-loanedObjectStatusNote");
		fieldSelectorByLabel.put("Loan Out Date",						 "csc-loanOut-loanOutDate");
		fieldSelectorByLabel.put("Loan Return Date", 					 "csc-loanOut-loanReturnDate");
		fieldSelectorByLabel.put("Loan Renewal Application Date", 		 "csc-loanOut-loanRenewalApplicationDate");
        fieldSelectorByLabel.put("Earliest Loan Out Date",               "csc-loanout-loanOutDateStart");
        fieldSelectorByLabel.put("Latest Loan Out Date",                 "csc-loanout-loanOutDateEnd");
        fieldSelectorByLabel.put("Earliest Loan Return Date",            "csc-loanout-loanReturnDateStart");
        fieldSelectorByLabel.put("Latest Loan Return Date",              "csc-loanout-loanReturnDateEnd");
        fieldSelectorByLabel.put("Earliest Loan Renewal Application Date","csc-loanout-loanRenewalApplicationDateStart");
        fieldSelectorByLabel.put("Latest Loan Renewal Application Date",  "csc-loanout-loanRenewalApplicationDateEnd");
        fieldSelectorByLabel.put("Earliest Modified Date",                "csc-loanout-updatedAtStart");
        fieldSelectorByLabel.put("Latest Modified Date",                  "csc-loanout-updatedAtEnd");
        fieldSelectorByLabel.put("Record last modified by",               "csc-loanout-updatedBy");

        dropDownMap.put("Loan Purpose", "csc-loanOut-loanPurpose");
        dropDownMap.put("Loan Status", "csc-loanOut-loanedObjectStatus");

		xpathMap.put("Borrower", 				     "//*[@id=\"primaryTab\"]/div/div[3]/div[2]/div[3]/div/div[2]/table/tbody/tr/td[1]/input[2]"); // autofill
		xpathMap.put("Borrower's Contact",			 "//*[@id=\"primaryTab\"]/div/div[3]/div[2]/div[3]/div/div[2]/table/tbody/tr/td[2]/input[2]"); // autofill
		xpathMap.put("Borrower's Authorizer", 		 "//*[@id=\"primaryTab\"]/div/div[3]/div[2]/div[3]/div/div[2]/table/tbody/tr/td[3]/input[2]"); //autofill
		xpathMap.put("Lender's Authorizer",			 "//*[@id=\"primaryTab\"]/div/div[3]/div[2]/div[2]/div/div[2]/table/tbody/tr/td[1]/input[2]"); //autofill
		xpathMap.put("Lender's Contact", 			 "//*[@id=\"primaryTab\"]/div/div[3]/div[2]/div[2]/div/div[2]/table/tbody/tr/td[2]/input[2]"); //autofill
        xpathMap.put("Borrower Search",              "//*[@id=\"all-content\"]/div/div[1]/div/div/div/div[2]/div[4]/div/div/div/div/div[2]/div[2]/div/ul/li/input[3]");
    }
}
