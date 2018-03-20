/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.termaat.bean;

import java.sql.Date;
/**
 *
 * @author termaat
 */
public class Check {

    private int checkId, checkAmt;
    private Date checkDate;
    private String typeName, categName, checkName;
    private Boolean isCleared;

    /**
     * @return the checkId
     */
    public int getCheckId() {
        return checkId;
    }

    /**
     * @param checkId the checkId to set
     */
    public void setCheckId(int checkId) {
        this.checkId = checkId;
    }

    /**
     * @return the checkAmt
     */
    public int getCheckAmt() {
        return checkAmt;
    }

    /**
     * @param checkAmt the checkAmt to set
     */
    public void setCheckAmt(int checkAmt) {
        this.checkAmt = checkAmt;
    }

    /**
     * @return the checkDate
     */
    public Date getCheckDate() {
        return checkDate;
    }

    /**
     * @param checkDate the checkDate to set
     */
    public void setCheckDate(Date checkDate) {
        this.checkDate = checkDate;
    }
    public void setCheckDate(String checkDate) {
        java.sql.Date sqlDate = java.sql.Date.valueOf(checkDate);
        this.checkDate = sqlDate;
    }       
    /**
     * @return the typeName
     */
    public String getTypeName() {
        return typeName;
    }

    /**
     * @param typeName the typeName to set
     */
    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    /**
     * @return the categName
     */
    public String getCategName() {
        return categName;
    }

    /**
     * @param categName the categName to set
     */
    public void setCategName(String categName) {
        this.categName = categName;
    }

    /**
     * @return the checkName
     */
    public String getCheckName() {
        return checkName;
    }

    /**
     * @param checkName the checkName to set
     */
    public void setCheckName(String checkName) {
        this.checkName = checkName;
    }

    /**
     * @return the isCleared
     */
    public Boolean getIsCleared() {
        return isCleared;
    }

    /**
     * @param isCleared the isCleared to set
     */
    public void setIsCleared(Boolean isCleared) {
        this.isCleared = isCleared;
    }
 
    
    
}
