
package com.AnggelusEsteticaFinal.controller;

import com.AnggelusEsteticaFinal.service.ComprarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/comprar")
public class ComprarController {
    
    @Autowired
    private ComprarService comprarService;

    
    @GetMapping("/listado")
    public String listado(Model model) {
        var lista = comprarService.getCompras(false);
        model.addAttribute("compras", lista);
        model.addAttribute("totalCompras", lista.size());

        return "/comprar/listado";
    }
}
