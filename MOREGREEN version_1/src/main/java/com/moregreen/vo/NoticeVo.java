package com.moregreen.vo;

public class NoticeVo {

   private int n_number, n_count;
   private String n_title, n_contents, n_image, n_date;
   
   public NoticeVo() {}
   
   public NoticeVo(int n_number, int n_count, String n_title, String n_contents, String n_image, String n_date) { // 공지사항 상세 페이지 사용
      this.n_number = n_number;
      this.n_count = n_count;
      this.n_title = n_title;
      this.n_contents = n_contents;
      this.n_image = n_image;
      this.n_date = n_date;
   }

   public NoticeVo(String n_title, int n_count, String n_contents, String n_image, String n_date) { // 공지사항 등록 페이지 사용
      this.n_title = n_title;
      this.n_count = n_count;
      this.n_contents = n_contents;
      this.n_image = n_image;
      this.n_date = n_date;
   }
   
   public NoticeVo(int n_number, String n_title, String n_date) { // notice.jsp 리스트 불러오기
      this.n_number = n_number;
      this.n_title = n_title;
      this.n_date = n_date;
   }

   public int getN_number() {
      return n_number;
   }
   public void setN_number(int n_number) {
      this.n_number = n_number;
   }
   public int getN_count() {
      return n_count;
   }
   public void setN_count(int n_count) {
      this.n_count = n_count;
   }
   public String getN_title() {
      return n_title;
   }
   public void setN_title(String n_title) {
      this.n_title = n_title;
   }
   public String getN_contents() {
      return n_contents;
   }
   public void setN_contents(String n_contents) {
      this.n_contents = n_contents;
   }
   public String getN_date() {
      return n_date;
   }
   public void setN_date(String n_date) {
      this.n_date = n_date;
   }

   public String getN_image() {
      return n_image;
   }

   public void setN_image(String n_image) {
      this.n_image = n_image;
   }
   
   
}