package com.moregreen.vo;

public class FundingVo {
   private int f_number;
   private String f_image;
   private String f_title, f_comments, f_contents;
   private int f_price, f_target, f_total;
   
   public FundingVo() {}

   public FundingVo(int f_number, String f_image, String f_title, String f_comments, String f_contents, int f_price, int f_target, int f_total) {
      this.f_number = f_number;
      this.f_image = f_image;
      this.f_title = f_title;
      this.f_comments = f_comments;
      this.f_contents = f_contents;
      this.f_price = f_price;
      this.f_target = f_target;
      this.f_total = f_total;
   }
   
   public FundingVo(String f_title, String f_comments,String f_contents, int f_price, int f_target) {
	      this.f_title = f_title;
	      this.f_comments = f_comments;
	      this.f_contents = f_contents;
	      this.f_price = f_price;
	      this.f_target = f_target;
	   }


	public FundingVo(int f_number, String f_image, String f_title, String f_contents, String f_comments, int f_price, int f_target) {
	   this.f_number = f_number;
	   this.f_image = f_image;
	   this.f_title = f_title;
	   this.f_contents = f_contents;
	   this.f_comments = f_comments;
	   this.f_price = f_price;
	   this.f_target = f_target;
	}

public int getF_number() {
      return f_number;
   }

   public void setF_number(int f_number) {
      this.f_number = f_number;
   }

   public String getF_image() {
      return f_image;
   }

   public void setF_image(String f_image) {
      this.f_image = f_image;
   }

   public String getF_title() {
      return f_title;
   }

   public void setF_title(String f_title) {
      this.f_title = f_title;
   }

   public String getF_contents() {
      return f_contents;
   }

   public void setF_contents(String f_contents) {
      this.f_contents = f_contents;
   }

   public int getF_price() {
      return f_price;
   }

   public void setF_price(int f_price) {
      this.f_price = f_price;
   }

   public int getF_target() {
      return f_target;
   }

   public void setF_target(int f_target) {
      this.f_target = f_target;
   }

   public int getF_total() {
      return f_total;
   }

   public void setF_total(int f_total) {
      this.f_total = f_total;
   }

	public String getF_comments() {
		return f_comments;
	}
	
	public void setF_comments(String f_comments) {
		this.f_comments = f_comments;
	}
}