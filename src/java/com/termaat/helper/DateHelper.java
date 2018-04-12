/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.termaat.helper;

import java.sql.Date;
import java.util.Calendar;
import java.util.Locale;

/**
 *
 * @author termaat
 */
public class DateHelper {
    
    public String getMonthDesc(int modifier){
        Calendar m_desc = Calendar.getInstance();
        m_desc.add(Calendar.MONTH, + modifier);
        String m_text = m_desc.getDisplayName(Calendar.MONTH, Calendar.LONG, Locale.ENGLISH);
        return m_text;
    }
    
    public String getYear(int modifier){
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.MONTH, + modifier);
        int i_year = cal.get(Calendar.YEAR);
        String s_year = String.valueOf(i_year);
        return s_year;
    }
    
    public Date getToday(){
        //java.util.Date today = new Date();
        //java.sql.Date sqlToday = new java.sql.Date(utilDate.getTime());
        java.sql.Date sqlToday = new java.sql.Date(Calendar.getInstance().getTime().getTime());
        return sqlToday;
    }
}
