package com.cykj.stopcard.bean;


public class Tblog
{

  private int LOGID;
  private String logname;
  private String operatinguser;
  private String operatingtime;
  private String operationtype;
  private String information;
  private String username;


  public String getUsername()
  {
    return username;
  }

  public void setUsername(String username)
  {
    this.username = username;
  }

  public String getLogname()
  {
    return logname;
  }

  public void setLogname(String logname)
  {
    this.logname = logname;
  }

  public String getOperationtype()
  {
    return operationtype;
  }

  public void setOperationtype(String operationtype)
  {
    this.operationtype = operationtype;
  }

  public int getLOGID()
  {
    return LOGID;
  }

  public void setLOGID(int LOGID)
  {
    this.LOGID = LOGID;
  }

  public String getOperatinguser()
  {
    return operatinguser;
  }

  public void setOperatinguser(String operatinguser)
  {
    this.operatinguser = operatinguser;
  }

  public String getOperatingtime()
  {
    return operatingtime;
  }

  public void setOperatingtime(String operatingtime)
  {
    this.operatingtime = operatingtime;
  }

  public String getInformation()
  {
    return information;
  }

  public void setInformation(String information)
  {
    this.information = information;
  }
}
