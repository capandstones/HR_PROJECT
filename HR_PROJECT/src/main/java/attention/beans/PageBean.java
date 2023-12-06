package attention.beans;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PageBean {
	
	// 최소 페이지 번호
	   private int min;
	   // 최대 페이지 번호
	   private int max;
	   // 이전 버튼의 페이지 번호
	   private int prevPage;
	   // 다음 버튼의 페이지 번호
	   private int nextPage;
	   // 전체 페이지 개수
	   private int pageCnt;
	   // 현재 페이지 번호
	   private int currentPage;
	   
	   //contentCnt:전체글 갯수 (오라클 table), currntPage:현재글번호(param),contentPageCnt:페이지당 글의 갯수(property),paginationCnt:페이지 버튼의 갯수(property)
	   public PageBean(int contentCnt,int currentPage,int contentPageCnt,int paginationCnt) {
		
		   //현재 페이지 번호
		   this.currentPage=currentPage;
		   
		   //전체 페이지 갯수
		   pageCnt=contentCnt/contentPageCnt;//533/10=53이므로 하나더 필요
		   if(contentCnt%contentPageCnt>0) {
			   pageCnt++;
		   }
		   /*
		   1~10 :  1(최소), 10(최대)
		   11~20: 11(최소), 20(최대)
		   21~30: 21(최소), 30(최대)
		   //최대 10,20,30 이므로 결국 최소에 9를 더한것과 같음
		   0~9:   1  첫화면
		   10~19: 11 두번째 
		   20~29: 21 새번째
		   
		   //페이지당 글의 갯수
		    * 0:  1/10*10 =>0  +1 =>1
		    * 1: 11/10*10 =>10 +1 =>2
		    * 2: 21/10*10 =>20 +1 =>3
		   */
		   min = ((currentPage - 1) / contentPageCnt) * contentPageCnt + 1;
		   max = min + paginationCnt - 1;
		   
		   if(max>pageCnt) {
			   max=pageCnt;
		   }
		   
		   prevPage=min-1;
		   nextPage=max+1;
		   
		   if(nextPage>pageCnt) {
			   nextPage=pageCnt;
		   }
		   
		   
	}

}
