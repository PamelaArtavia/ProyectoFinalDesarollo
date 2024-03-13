package com.AnggelusEsteticaFinal.service.impl;

import com.AnggelusEsteticaFinal.dao.ComprarDao;
import com.AnggelusEsteticaFinal.domain.Comprar;
import com.AnggelusEsteticaFinal.service.ComprarService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ComprarServiceImpl implements ComprarService {

    @Autowired
    private ComprarDao comprarDao;

    @Override
    @Transactional(readOnly = true)
    public List<Comprar> getCompras(boolean activo) {
        var lista = comprarDao.findAll();
        if (activo) {
            lista.removeIf(c -> !c.isActivo());
        }

        return lista;
    }

    
    

}
