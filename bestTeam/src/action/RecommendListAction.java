package action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MyPageProService;
import svc.RecommendListService;
import vo.ActionForward;
import vo.FavorBean;
import vo.ItemBean;

public class RecommendListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if (id == null) {
//			out.println("<script>"); // 자바스크립트 시작 태그
//			out.println("alert('로그인 후 이용해주세요.')"); // 오류 메세지 다이얼로그 표시
//			out.println("history.back()"); // 오류 메세지 다이얼로그 표시
//			out.println("</script>"); // 자바스크립트 종료 태그
			forward = new ActionForward();
			forward.setPath("/shop/product-recommendList.jsp");
			
			return forward;
		}
		
		// user favor 가져오기
		MyPageProService myPageProService = new MyPageProService();
		FavorBean favorBean = myPageProService.getMyFavor(id);
		
		// user favor에서 하나라도 0이면 취향 등록 해야함
		if (favorBean.getUser_favor_aroma() == 0) {
//			out.println("<script>"); // 자바스크립트 시작 태그
//			out.println("alert('취향 등록 후 이용할 수 있습니다.')"); // 오류 메세지 다이얼로그 표시
////			out.println("history.back()"); // 오류 메세지 다이얼로그 표시
//			out.println("</script>"); // 자바스크립트 종료 태그
			forward = new ActionForward();
			forward.setPath("/shop/product-recommendList.jsp");
			
			return forward;
		}
		
		// item_favor 리스트 가져오기
		RecommendListService recommendListService = new RecommendListService();
		ArrayList<ItemBean> list = recommendListService.productList();
		
		HashMap<Integer, Integer> productList = getRecommendList(list, favorBean);
		list = recommendListService.getRecommendList(productList);
		
		request.setAttribute("list", list);
		
		forward = new ActionForward();
		forward.setPath("/shop/product-recommendList.jsp");
		
		return forward;
	}
	
	public HashMap<Integer, Integer> getRecommendList (ArrayList<ItemBean> list, FavorBean favorBean) {
		ArrayList<ItemBean> itemList = new ArrayList<>();
		int aroma, acidity, bitter, sweet, body, sum;
//		ArrayList<Integer> dist = new ArrayList<>();
//		HashMap<Integer, Double> dist = new HashMap<Integer, Double>();
		HashMap<Integer, Integer> dist = new HashMap<Integer, Integer>();
		
//		System.out.println("============= 유저 정보 =============");
//		System.out.println("getUser_favor_aroma :: " + favorBean.getUser_favor_aroma());
//		System.out.println("getUser_favor_acidity :: " + favorBean.getUser_favor_acidity());
//		System.out.println("getUser_favor_sweetness :: " + favorBean.getUser_favor_sweetness());
//		System.out.println("getUser_favor_bitterness :: " + favorBean.getUser_favor_bitterness());
//		System.out.println("getUser_favor_body :: " + favorBean.getUser_favor_body());
//		System.out.println("=====================================");
//		System.out.println("list.size() :: " + list.size());
		
		
		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// 유클리디안 거리법
		
		for (int i = 0 ; i < list.size() ; i++) {
//			System.out.print("[" + list.get(i).getItem_favor_item_num() + "] ");
//			System.out.print(list.get(i).getItem_favor_aroma() + " ");
//			System.out.print(list.get(i).getItem_favor_acidity() + " ");
//			System.out.print(list.get(i).getItem_favor_bitterness() + " ");
//			System.out.print(list.get(i).getItem_favor_sweetness() + " ");
//			System.out.println(list.get(i).getItem_favor_body());
			
			aroma = (int) Math.pow(list.get(i).getItem_favor_aroma() - favorBean.getUser_favor_aroma(), 2);
			acidity = (int) Math.pow(list.get(i).getItem_favor_acidity() - favorBean.getUser_favor_acidity(), 2);
			sweet = (int) Math.pow(list.get(i).getItem_favor_sweetness() - favorBean.getUser_favor_sweetness(), 2);
			bitter = (int) Math.pow(list.get(i).getItem_favor_bitterness() - favorBean.getUser_favor_bitterness(), 2);
			body = (int) Math.pow(list.get(i).getItem_favor_body() - favorBean.getUser_favor_body(), 2);
			
//			System.out.print(aroma + " ");
//			System.out.print(acidity + " ");
//			System.out.print(bitter + " ");
//			System.out.print(sweet + " ");
//			System.out.println(body + " ");

			sum = aroma + acidity + bitter + sweet + body;
			if (sum > 20) continue; // 너무 맞지 않는 제품은 거르기
//			System.out.print( "(( " + sum + " ))");
//			dist.add(sum);
			dist.put(list.get(i).getItem_favor_item_num(), sum);
			
		}
		
		
		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// 상관계수 법
		// name1 :: 유저, name2 :: list.get(i) -> 아이템
		// X :: 유저의 취향, Y :: 아이템의 취향
//		int sumX = favorBean.getUser_favor_aroma() + favorBean.getUser_favor_acidity() + favorBean.getUser_favor_bitterness() + favorBean.getUser_favor_sweetness() + favorBean.getUser_favor_body();
//		int sumY = 0;
//		int sumPowX = (int) (Math.pow(favorBean.getUser_favor_aroma(), 2) + Math.pow(favorBean.getUser_favor_acidity(), 2) + Math.pow(favorBean.getUser_favor_bitterness(), 2) + Math.pow(favorBean.getUser_favor_sweetness(), 2) + Math.pow(favorBean.getUser_favor_body(), 2));
//		int sumPowY = 0;
//		int sumXY = 0;
//		int count = 5;
//		double sum2 = 0.0;
////		System.out.println("sumX : " + sumX);
////		System.out.println("sumPowX : " + sumPowX);
//		for (int i = 0 ; i < list.size() ; i++) {
//			sumY = list.get(i).getItem_favor_aroma();
//			sumY += list.get(i).getItem_favor_acidity();
//			sumY += list.get(i).getItem_favor_bitterness();
//			sumY += list.get(i).getItem_favor_sweetness();
//			sumY += list.get(i).getItem_favor_body();
//			
//			sumPowY = (int) (Math.pow(list.get(i).getItem_favor_aroma(), 2));
//			sumPowY += (int) (Math.pow(list.get(i).getItem_favor_acidity(), 2));
//			sumPowY += (int) (Math.pow(list.get(i).getItem_favor_bitterness(), 2));
//			sumPowY += (int) (Math.pow(list.get(i).getItem_favor_sweetness(), 2));
//			sumPowY += (int) (Math.pow(list.get(i).getItem_favor_body(), 2));
//			
//			sumXY = favorBean.getUser_favor_aroma() * list.get(i).getItem_favor_aroma();
//			sumXY += favorBean.getUser_favor_acidity() * list.get(i).getItem_favor_acidity();
//			sumXY += favorBean.getUser_favor_bitterness() * list.get(i).getItem_favor_bitterness();
//			sumXY += favorBean.getUser_favor_sweetness() * list.get(i).getItem_favor_sweetness();
//			sumXY += favorBean.getUser_favor_body() * list.get(i).getItem_favor_body();
//			
//			sum2 = (sumXY- ((sumX*sumY)/count)) / Math.sqrt( (sumPowX - (Math.pow(sumX,2) / count)) * (sumPowY - (Math.pow(sumY,2)/count)));
//			sum = (int)(sum2 * 100); // 정렬을 위해 100을 곱해줌
//			
//			System.out.print("sumX :: " + sumX );
//			System.out.print(" sumY :: " + sumY );
//			System.out.print(" sumPowX :: " + sumPowX );
//			System.out.print(" sumPowY :: " + sumPowY );
//			System.out.print(" sumXY :: " + sumXY );
//			System.out.println(" sum2 :: " + sum2);
//			if (sum < 50) continue; // 너무 맞지 않는 제품은 거른다.
//			
//			dist.put(list.get(i).getItem_favor_item_num(), sum);
//		}
		
//		System.out.println("dist");
//		System.out.println(dist);
		
		
		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		List<Map.Entry<Integer, Integer>> sortedList = new LinkedList<>(dist.entrySet());
		
		Collections.sort(sortedList, new Comparator<Map.Entry<Integer, Integer>>() {
			@Override
			public int compare(Entry<Integer, Integer> o1, Entry<Integer, Integer> o2) {
				int comp = (o1.getValue() - o2.getValue()); // 오름차순 정렬
//				int comp = (o1.getValue() - o2.getValue()) * -1; // 내림차순 정렬
				return comp == 0 ? o1.getKey().compareTo(o2.getKey()) : comp;
			}
		});
		
		HashMap<Integer, Integer> sortedMap = new LinkedHashMap<>();
		for (Iterator<Map.Entry<Integer, Integer>> iter = sortedList.iterator(); iter.hasNext() ;) {
			Map.Entry<Integer, Integer> entry = iter.next();
			sortedMap.put(entry.getKey(), entry.getValue());
		}
		
//		System.out.println("================== 정렬 된 후의 아이템 ================== ");
//		System.out.println(sortedMap);
		
		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
//		List<Map.Entry<Integer, Double>> sortedList = new LinkedList<>(dist.entrySet());
//		
//		Collections.sort(sortedList, new Comparator<Map.Entry<Integer, Double>>() {
//			@Override
//			public int compare(Entry<Integer, Double> o1, Entry<Integer, Double> o2) {
//				int comp = (int) ((o1.getValue() - o2.getValue()) * -1);
//				return comp == 0 ? o1.getKey().compareTo(o2.getKey()) : comp;
//			}
//		});
//		
//		HashMap<Integer, Double> sortedMap = new LinkedHashMap<>();
//		for (Iterator<Map.Entry<Integer, Double>> iter = sortedList.iterator(); iter.hasNext() ;) {
//			Map.Entry<Integer, Double> entry = iter.next();
//			sortedMap.put(entry.getKey(), entry.getValue());
//		}
//		
//		System.out.println("================== 정렬 된 후의 아이템 ================== ");
//		System.out.println(sortedMap);
		
		return sortedMap;
//		return null;
	}

}









