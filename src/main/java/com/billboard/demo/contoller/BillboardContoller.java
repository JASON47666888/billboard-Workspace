package com.billboard.demo.contoller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.billboard.demo.model.Billboard;
import com.billboard.demo.service.impl.BillboardServiceImpl;

@Controller
public class BillboardContoller {
	@Autowired
	private BillboardServiceImpl BService;

	@GetMapping("billboard/all")
	public String findAll(Model model) {
		List<Billboard> board = BService.findAll();
		model.addAttribute("board", board);
		return "billboard/billboardAll";
	}

	@GetMapping("billboard/add")
	public String add(Model model) {
		Billboard billboard = new Billboard();
		model.addAttribute("billboard", billboard);
		return "billboard/billboardAdd";
	}

	@PostMapping("billboard/creat")
	public String creat(@ModelAttribute Billboard billboard, Model model) {
		BService.create(billboard);
		return "redirect:all";
	}

	@GetMapping("billboard/edit")
	public String edit(@RequestParam Integer id, Model model) {
		Billboard billboard = BService.find(id);
		model.addAttribute("billboard", billboard);
		return "billboard/billboardEdit";
	}

	@PutMapping("billboard/updata")
	public String updata(@ModelAttribute Billboard billboard, Model model) {
		BService.create(billboard);
		return "redirect:all";
	}

	@DeleteMapping("billboard/delete")
	public String delete(@RequestParam Integer id, Model model) {
		BService.delete(id);
		return "redirect:all";
	}

}
