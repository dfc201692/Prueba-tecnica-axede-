import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http'; // Importa el HttpClient
import { UsuarioService } from 'src/app/service/usuario.service';

@Component({
  selector: 'app-registro',
  templateUrl: './registro.component.html',
  styleUrls: ['./registro.component.css']
})
export class RegistroComponent  {
  
  idHabitacion: string = '';
  fechaInicio: string = '';
  fechaFin: string = '';
  numeroPersonas: string = '';

  constructor(private usuarioService: UsuarioService) {} // Inyecta el servicio

  guardarReserva() {
    const reservaData = {
      idHabitacion: this.idHabitacion,
      fechaInicio: this.fechaInicio,
      fechaFin: this.fechaFin,
      numeroPersonas: this.numeroPersonas
      // Agrega otros campos según sea necesario
    };

    this.usuarioService.guardarUsuario(reservaData).subscribe(response => {
      console.log(response);
      // Puedes manejar la respuesta del servidor aquí
    });
  }


}
