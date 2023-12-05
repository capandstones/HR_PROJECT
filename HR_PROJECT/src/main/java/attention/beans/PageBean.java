package attention.beans;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PageBean {

	// �ּ� ������ ��ȣ
	private int min;
	// �ִ� ������ ��ȣ
	private int max;
	// ���� ��ư�� ������ ��ȣ
	private int prevPage;
	// ���� ��ư�� ������ ��ȣ
	private int nextPage;
	// ��ü ������ ����
	private int pageCnt;
	// ���� ������ ��ȣ
	private int currentPage;

	// contentCnt:��ü�� ���� (����Ŭ table), currntPage:����۹�ȣ(param),contentPageCnt:�������� ����
	// ����(property),paginationCnt:������ ��ư�� ����(property)
	public PageBean(int contentCnt, int currentPage, int contentPageCnt, int paginationCnt) {

		// ���� ������ ��ȣ
		this.currentPage = currentPage;

		// ��ü ������ ����
		pageCnt = contentCnt / contentPageCnt;// 533/10=53�̹Ƿ� �ϳ��� �ʿ�
		if (contentCnt % contentPageCnt > 0) {
			pageCnt++;
		}
		/*
		 * 1~10 : 1(�ּ�), 10(�ִ�) 11~20: 11(�ּ�), 20(�ִ�) 21~30: 21(�ּ�), 30(�ִ�) //�ִ�
		 * 10,20,30 �̹Ƿ� �ᱹ �ּҿ� 9�� ���ѰͰ� ���� 0~9: 1 ùȭ�� 10~19: 11 �ι�° 20~29: 21 ����°
		 * 
		 * //�������� ���� ���� 0: 1/10*10 =>0 +1 =>1 1: 11/10*10 =>10 +1 =>2 2: 21/10*10 =>20
		 * +1 =>3
		 */
		min = ((currentPage - 1) / contentPageCnt) * contentPageCnt + 1;
		max = min + paginationCnt - 1;

		if (max > pageCnt) {
			max = pageCnt;
		}

		prevPage = min - 1;
		nextPage = max + 1;

		if (nextPage > pageCnt) {
			nextPage = pageCnt;
		}

	}

}