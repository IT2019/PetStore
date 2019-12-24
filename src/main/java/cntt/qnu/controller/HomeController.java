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
import cntt.qnu.model.LoaiVatNuoiInfo;
import cntt.qnu.model.VatNuoiInfo;

@Controller
public class HomeController {
	@Autowired
	private VatNuoiDAO vatnuoiDao;

	@RequestMapping("/")
	public String loadIndex(Model model) {
		List<VatNuoiInfo> list= vatnuoiDao.showList();
		List<LoaiVatNuoiInfo> loai= vatnuoiDao.loadLoai();
		model.addAttribute("pets",list);
		 model.addAttribute("loai",loai);
		return "client/index";
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
