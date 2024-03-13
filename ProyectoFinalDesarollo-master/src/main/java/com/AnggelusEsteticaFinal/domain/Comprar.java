package com.AnggelusEsteticaFinal.domain;

import jakarta.persistence.*;
import java.io.Serializable;
import lombok.Data;

@Data
@Entity
@Table(name = "comprar")
public class Comprar implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_comprar")
    private Long idComprar;
    private String descripcion;
    private String rutaImagen;
    private boolean activo;
}







/*CREATE TABLE anggelusestetica.comprar (
  id_comprar INT NOT NULL AUTO_INCREMENT,
  descripcion VARCHAR(30) NOT NULL,
  ruta_imagen VARCHAR(1024),
  activo BOOL,
  PRIMARY KEY (id_comprar)*/
