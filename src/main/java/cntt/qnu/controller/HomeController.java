package cntt.qnu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import cntt.qnu.dao.VatNuoiDAO;
import cntt.qnu.model.CartInfo;
import cntt.qnu.model.CustomerInfo;
import cntt.qnu.model.LoaiVatNuoiInfo;
import cntt.qnu.model.VatNuoiInfo;

@Controller
public class HomeController {
	@Autowired
	private VatNuoiDAO vatnuoiDao;

	@RequestMapping(value = {"/","/index"})
	public String loadIndex(Model model) {
		List<VatNuoiInfo> list= vatnuoiDao.showList();
		List<LoaiVatNuoiInfo> loai= vatnuoiDao.loadLoai();
		List<VatNuoiInfo> list1= vatnuoiDao.getVatNuoiById(3);
		model.addAttribute("pets",list1);
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
		
		CustomerInfo customerInfo = new CustomerInfo(name, address, email, phone);
		
		cartInfo.setCustomerInfo(customerInfo);
		
		//orderDAO.saveOrder(cartInfo);
		
		session.removeAttribute("Cart");
		
		return "redirect:/view-cart";
	}

	@RequestMapping(value = "/getdata", method = RequestMethod.GET)
	public @ResponseBody String filter(HttpServletRequest request,Model model) {
		String loai = request.getParameter("loai");
		String gia = request.getParameter("gia");
		int price= Integer.parseInt(gia);
		List<VatNuoiInfo> list1= vatnuoiDao.locTheoLoai(loai,price);
		model.addAttribute("pets",list1);
		return "client/index";
	}

}
