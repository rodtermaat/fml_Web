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

public class EditCheck {

    private int checkId, checkAmt, checkCategId;
    private Date checkDate;
    private String checkName, checkType;
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
     * @return the checkType
     */
    public String getCheckType() {
        return checkType;
    }

    /**
     * @param checkType the checkType to set
     */
    public void setCheckType(String checkType) {
        this.checkType = checkType;
    }

    /**
     * @return the checkCategId
     */
    public int getCheckCategId() {
        return checkCategId;
    }

    /**
     * @param checkCategId the checkCategId to set
     */
    public void setCheckCategId(int checkCategId) {
        this.checkCategId = checkCategId;
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


