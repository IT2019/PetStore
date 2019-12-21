package cntt.qnu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cntt.qnu.dao.VatNuoiDAO;
import cntt.qnu.model.VatNuoiInfo;

@Controller
public class HomeController {
	@Autowired
	private VatNuoiDAO vatnuoiDao;

	@RequestMapping("/")
	public String loadIndex(Model model) {
		List<VatNuoiInfo> list= vatnuoiDao.showList();
		model.addAttribute("pets",list);
		return "index";
	}


}
