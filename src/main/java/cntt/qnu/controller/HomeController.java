package cntt.qnu.controller;

import java.util.Calendar;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.SessionScope;

import cntt.qnu.dao.MailService;
import cntt.qnu.dao.VatNuoiDAO;
import cntt.qnu.entity.DongDH;
import cntt.qnu.model.Cart;
import cntt.qnu.model.CartInfo;
import cntt.qnu.model.CustomerInfo;
import cntt.qnu.model.DonHangInfo;
import cntt.qnu.model.DongDHInfo;
import cntt.qnu.model.LoaiVatNuoiInfo;
import cntt.qnu.model.Mail;
import cntt.qnu.model.VatNuoiInfo;

@Controller
public class HomeController {
	@Autowired
	private VatNuoiDAO vatnuoiDao;

	@Autowired
	private MailService mailService;
	
	private static Calendar cal;

	@RequestMapping(value = {"/","/index"})
	public String loadIndex(Model model) {

		List<VatNuoiInfo> list= vatnuoiDao.showList();
		List<LoaiVatNuoiInfo> loai= vatnuoiDao.loadLoai();
		model.addAttribute("pets",list);
		model.addAttribute("loai",loai);
		return "client/index";
	}
	@RequestMapping(value = "/add-to-cart")
	public String addToCart(HttpServletRequest request, @RequestParam(name = "code") String code,
			@RequestParam(name = "quantity", defaultValue = "1") int quantity) {
				
		VatNuoiInfo vatnuoiInfo = vatnuoiDao.findById(Long.parseLong(code));

		CartInfo cartInfo = null;

		HttpSession session = request.getSession();

		if (session.getAttribute("Cart") == null)
			cartInfo = new CartInfo();
		else
			cartInfo = (CartInfo) session.getAttribute("Cart");

		cartInfo.addVatNuoi(vatnuoiInfo, quantity);
		
		session.setAttribute("Cart", cartInfo);
		
		return "redirect:/index";
	}
	
	@RequestMapping(value = "/update-cart")
	public String updateCart(HttpServletRequest request, @RequestParam(name = "code") String code,
			@RequestParam(name = "quantity") String quantity) {
		CartInfo cartInfo = null;

		HttpSession session = request.getSession();

		if (session.getAttribute("Cart") != null) {
			cartInfo = (CartInfo) session.getAttribute("Cart");
			
			cartInfo.updateVatNuoi(code, quantity);
			
			session.setAttribute("Cart", cartInfo);
		}
			
		return "redirect:/view-cart";
	}
	
	@RequestMapping(value = "/delete-item-cart")
	public String deleteItemCart(HttpServletRequest request, @RequestParam(name = "code") String code) {
		CartInfo cartInfo = null;

		HttpSession session = request.getSession();

		if (session.getAttribute("Cart") != null) {
			cartInfo = (CartInfo) session.getAttribute("Cart");

			cartInfo.removeVatNuoi(vatnuoiDao.findById(Long.parseLong(code)));
			
			session.setAttribute("Cart", cartInfo);
		}
			
		return "redirect:/view-cart";
	}
	
	@RequestMapping(value = "view-cart")
	public String viewCart(HttpServletRequest request) {
		return "client/view_cart";
	}
	
	@RequestMapping(value = "checkout")
	public String checkout() {
		return "client/checkout";
	}
	@RequestMapping(value = "order")
	public String order(HttpServletRequest request, @RequestParam(name = "name") String name,
			@RequestParam(name = "phone") String phone, @RequestParam(name = "email") String email,
			@RequestParam(name = "address") String address, @RequestParam(name = "note") String note) {
		HttpSession session = request.getSession();
		
		CartInfo cartInfo = (CartInfo)session.getAttribute("Cart");
		
		// CustomerInfo customerInfo = new CustomerInfo(name, address, email, phone);
		
		// cartInfo.setCustomerInfo(customerInfo);

		SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd"); 
		String ngay = getToday();
		Date date=null;
		try { 
			date = ft.parse(ngay); 
			
		} catch (ParseException e) { 
			System.out.println("Khong the parse duoc boi su dung " + ft); 
		}
		Random rand = new Random();
		int iddh= rand.nextInt(1000);
		DonHangInfo dh = new DonHangInfo(iddh, name, phone, email, date, address);
		
		vatnuoiDao.themThongTinDonHang(dh);
		
		// int iddh = vatnuoiDao.lastIdDH();
		for (Cart list : cartInfo.getCartLines()) {
			int id = list.getVatNuoiInfo().getId();
			int soluong = list.getQuantity();
			System.out.println(id +"-"+soluong);
			vatnuoiDao.themDongDH(iddh, id, soluong);
		}
			

		session.removeAttribute("Cart");
		
		return "redirect:/view-cart";
	}

	public static String getToday() {
		cal = Calendar.getInstance();
		return cal.get(Calendar.YEAR) + "-" + (cal.get(Calendar.MONTH) + 1) + "-" + cal.get(Calendar.DAY_OF_MONTH);
	}

	@RequestMapping(value = "/getdata", method = RequestMethod.GET)
	public String filter(HttpServletRequest request,Model model) {
		String loai = request.getParameter("loai");
		String gia = request.getParameter("gia");
		int price= Integer.parseInt(gia);
		List<VatNuoiInfo> list1= vatnuoiDao.locTheoLoai(loai,price);
		List<LoaiVatNuoiInfo> listloai= vatnuoiDao.loadLoai();
		model.addAttribute("loai",listloai);
		model.addAttribute("pets",list1);
		return "client/index";
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(HttpServletRequest request,Model model) {
		String key = request.getParameter("key");
		List<VatNuoiInfo> list1= vatnuoiDao.timKiem(key);
		List<LoaiVatNuoiInfo> listloai= vatnuoiDao.loadLoai();
		model.addAttribute("loai",listloai);
		model.addAttribute("pets",list1);
		return "client/index";
	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(HttpServletRequest request, @RequestParam(name = "code") String code ,Model model) {			
		VatNuoiInfo vatnuoiInfo = vatnuoiDao.findById(Long.parseLong(code));
		model.addAttribute("pet",vatnuoiInfo);
		return "client/view_product";
	}

	@RequestMapping(value = "/admin")
	public String admin(Model model) {
		List<DongDHInfo> list = vatnuoiDao.acceptAdmin();
		model.addAttribute("rowddh", list);
		return "admin";
	}

	@RequestMapping(value = "/updatestatus/{id}", method = RequestMethod.GET)
	public String update(@PathVariable("id") int id) {
		System.out.println("id cua ban la: "+id);
		
		DonHangInfo dh = vatnuoiDao.getDH(vatnuoiDao.getDDH(id).getIddh());
		vatnuoiDao.updateStatus(vatnuoiDao.getDDH(id));
		Mail mail = new Mail();
		mail.setMailFrom("congchuangutrongrung09@gmail.com");
		mail.setMailTo(dh.getEmail());
		mail.setMailSubject("PetStore");
		mail.setMailContent("Cảm ơn "+dh.getTennguoidat()+" đã ủng hộ. Đơn hàng đặt "+ vatnuoiDao.getDDH(id).getSoluong()+
		" "+ vatnuoiDao.getTen(vatnuoiDao.getDDH(id).getIdvatnuoi()).getTenvatnuoi() + " vào ngày " + dh.getNgaydat() + " đang được giao." );
		mailService.sendEmail(mail);
		return "redirect:/admin";
	}

	
}
