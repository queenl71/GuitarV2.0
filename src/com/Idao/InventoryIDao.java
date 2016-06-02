package com.Idao;

import java.util.List;

import model.Guitar;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import model.Guitar;
import model.GuitarSpec;


public class InventoryIDao {
	  private List guitars;

	  public void setGuitar(List guitars) {
			this.guitars = guitars;
		}
	  public void addGuitar(Guitar guitar) {
		  if(guitar.getSpec()!=null){
	              guitars.add(guitar);}
	  }
	  
	  
	//数据库 public interface InventoryIDao {
	//数据库public boolean addGuitar(Guitar guitar) throws Exception;	
	//数据库public boolean updateGuitar() throws Exception;
	//数据库public boolean deleteGuitar() throws Exception;
	//数据库public List<Guitar> searchGuitar(Guitar  Guitar) throws Exception;
	//数据库}
	  
	  
	  
	  public List getGuitar() {
	        return guitars;
	 
	  }

	  public List search(Guitar guitar1) {     //参数
	    List matchingGuitars = new ArrayList();
	    for (Iterator i = guitars.iterator(); i.hasNext(); ) {
	      Guitar guitar2 = (Guitar)i.next();      //数据库
	      if (guitar2.getSpec().matches(guitar1.getSpec()))
	        matchingGuitars.add(guitar2);
	    }
	    return matchingGuitars;
	  }
	}


