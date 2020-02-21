package org.collectionspace.qa.utils;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.safari.SafariDriver;

public class Config {

    private String tenantName;
    private String hostname;
    private String port;
    private String baseURL;
    private String username;
    private String password;
    private Browser browser;
    
    private static String DEFAULT_TENANT_NAME = "core";
    private static String DEFAULT_HOSTNAME = "qa.collectionspace.org";     
    private static String DEFAULT_PORT = "8180";
    private static String DEFAULT_PASSWORD = "Administrator";
    private Browser DEFAULT_BROWSER = Browser.FIREFOX;
    
    private String TENANT_NAME_PROPERTY = "tenant";
    private String HOSTNAME_PROPERTY = "hostname";
    private String PORT_PROPERTY = "port";
    private String PASSWORD_PROPERTY = "password";
    private String BROWSER_NAME_PROPERTY = "browser";
        
    public Config() {
      init();
    }
    
    private void init() {
      setTenantName();
    
      setHostname();
      setPort();
      setBaseURL();
      
      setUsername();
      setPassword();
    }

    public void setTenantName() {
      String tenantName = System.getProperty(TENANT_NAME_PROPERTY);
      if (tenantName == null || tenantName.trim().isEmpty()) {
        tenantName = DEFAULT_TENANT_NAME;
      }
      this.tenantName = tenantName;
    }

    public String getTenantName() {
      return this.tenantName;
    }

    public void setHostname() {
      String hostname = System.getProperty(HOSTNAME_PROPERTY);
      if (hostname == null || hostname.trim().isEmpty()) {
        hostname = DEFAULT_HOSTNAME;
      }
      this.hostname = hostname;
    }
    
    public String getHostname() {
      return this.hostname;
    }

    public void setPort() {
      String port = System.getProperty(PORT_PROPERTY);
      if (port == null || port.trim().isEmpty()) {
        port = DEFAULT_PORT;
      }
      this.port = port;
    }
    
    public String getPort() {
      return this.port;
    }
        
    public void setBaseURL() {
      this.baseURL = String.format("http://%s:%s/collectionspace/ui/%s/html/", getHostname(), getPort(), getTenantName());
    }

    public String getBaseURL() {
      return this.baseURL;
    }
    
    public void setUsername() {
      // TODO: Support various formats of username other than this default
      String username = String.format("admin@%s.collectionspace.org", getTenantName());
      this.username = username;
    }
    
    public String getUsername() {
      return this.username;
    }

    public void setPassword() {
      String password = System.getProperty(PASSWORD_PROPERTY);
      if (password == null || password.trim().isEmpty()) {
        password = DEFAULT_PASSWORD;
      }
      this.password = password;
    }

    public String getPassword() {
      return this.password;
    }
            
    public void setBrowser() {
      Browser browser;
      String browserName = System.getProperty(BROWSER_NAME_PROPERTY);
      if (browserName == null || browserName.trim().isEmpty()) {
        browser = DEFAULT_BROWSER;
      } else {
        // Look up the matching enum via its string name; e.g. 'chrome', 'firefox' ...
        browser = Browser.getEnumByString(browserName.trim().toLowerCase());
        if (browser == null) {
          throw new RuntimeException(String.format("Unrecognized value '%s' for browser name", browserName));
          // TODO: Return list of valid values; e.g. as per
          // http://stackoverflow.com/questions/13783295/getting-all-names-in-an-enum-as-a-string
        }
      }
      this.browser = browser;
    }

    public enum Browser {
      CHROME("chrome"),
      FIREFOX("firefox"),
      SAFARI("safari");
      // IE,
      // EDGE ...
      private final String browserName;
      private Browser(String bName) {
        browserName = bName;
      }
      @Override
      public String toString(){
        return browserName;
      }
      public static Browser getEnumByString(String str){
        for(Browser browser : Browser.values()){
          if (str.equals(browser.toString())) {
            return browser;
          }
        }
        return null;
      }
    }

    public WebDriver getBrowserDriver() {
      if (this.browser == null) {
        setBrowser();
      }
      WebDriver driver = null;
      switch(this.browser) {
        case CHROME:
          driver = new ChromeDriver();
          break;
        case FIREFOX:
          driver = new FirefoxDriver();
          break;
        case SAFARI:
          driver = new SafariDriver();
          break;
      }
      return driver;
    }

}