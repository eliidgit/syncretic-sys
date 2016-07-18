package com.yunmel.frame.sys.model;

import javax.persistence.Table;

import com.yunmel.syncretic.beans.BaseEntity;


/**
* @author yunmel
*/
@SuppressWarnings({ "unused"})
@Table(name="sys_config")
public class SysConfig extends BaseEntity{
  private static final long serialVersionUID = 1L;
  private String label;    //  
	private String value;    //  
	private String delFlag;    //  
	private String createBy;    //创建者  
	private Long createDate;    //  
	private String updateBy;    //更新者  
	private Long updateDate;    //  
	
	
	public String getLabel(){
		return this.getString("label");
	}
	
	public void setLabel(String label){
		this.set("label",label);
	}
	public String getValue(){
		return this.getString("value");
	}
	
	public void setValue(String value){
		this.set("value",value);
	}
	public String getDelFlag(){
		return this.getString("delFlag");
	}
	
	public void setDelFlag(String delFlag){
		this.set("delFlag",delFlag);
	}
	public String getCreateBy(){
		return this.getString("createBy");
	}
	
	public void setCreateBy(String createBy){
		this.set("createBy",createBy);
	}
	public Long getCreateDate(){
		return this.getLong("createDate");
	}
	
	public void setCreateDate(Long createDate){
		this.set("createDate",createDate);
	}
	public String getUpdateBy(){
		return this.getString("updateBy");
	}
	
	public void setUpdateBy(String updateBy){
		this.set("updateBy",updateBy);
	}
	public Long getUpdateDate(){
		return this.getLong("updateDate");
	}
	
	public void setUpdateDate(Long updateDate){
		this.set("updateDate",updateDate);
	}


}
