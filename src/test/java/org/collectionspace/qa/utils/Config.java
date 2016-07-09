package org.collectionspace.qa.utils;

public class Config {

    private String TENANT_NAME;
    
    private String HOSTNAME;
    private String PORT;
    private String BASE_URL;

    private String USERNAME;
    private String PASSWORD;
    
    private static String DEFAULT_TENANT_NAME = "core";
    
    private static String DEFAULT_HOSTNAME = "qa.collectionspace.org";     
    private static String DEFAULT_PORT = "8180";

    private static String DEFAULT_PASSWORD = "Administrator";
    
    private String TENANT_NAME_PROPERTY = "tenant";
    private String HOSTNAME_PROPERTY = "hostname";
    private String PORT_PROPERTY = "port";
    private String PASSWORD_PROPERTY = "password";
        
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
      TENANT_NAME = tenantName;
    }

    public String getTenantName() {
      return TENANT_NAME;
    }

    public void setHostname() {
      String hostname = System.getProperty(HOSTNAME_PROPERTY);
      if (hostname == null || hostname.trim().isEmpty()) {
        hostname = DEFAULT_HOSTNAME;
      }
      HOSTNAME = hostname;
    }
    
    public String getHostname() {
      return HOSTNAME;
    }

    public void setPort() {
      String port = System.getProperty(PORT_PROPERTY);
      if (port == null || port.trim().isEmpty()) {
        port = DEFAULT_PORT;
      }
      PORT = port;
    }
    
    public String getPort() {
      return PORT;
    }
        
    public void setBaseURL() {
      BASE_URL = String.format("http://%s:%s/collectionspace/ui/%s/html/", getHostname(), getPort(), getTenantName());
    }

    public String getBaseURL() {
      return BASE_URL;
    }
    
    public void setUsername() {
      // TODO: Support various formats of username other than this default
      String username = String.format("admin@%s.collectionspace.org", getTenantName());
      USERNAME = username;
    }
    
    public String getUsername() {
      return USERNAME;
    }

    public void setPassword() {
      String password = System.getProperty(PASSWORD_PROPERTY);
      if (password == null || password.trim().isEmpty()) {
        password = DEFAULT_PASSWORD;
      }
      PASSWORD = password;
    }

    public String getPassword() {
      return PASSWORD;
    }
            
    // TODO: Configure the browser (and its driver) to be used.
    // (Consider using an Enum to encapsulate these characteristics.)

}