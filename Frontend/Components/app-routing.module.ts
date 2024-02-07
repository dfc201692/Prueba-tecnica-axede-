import { ModuleWithProviders, NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { RegistroComponent } from './registro/registro.component'; // Asegúrate de importar correctamente el componente

const routes: Routes = [
  { path: '',component:RegistroComponent}, // Ruta para el componente RegistroComponent
];

/*@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }*/


export const appRoutingProviders:any[]=[];
export const routing: ModuleWithProviders<any> = RouterModule.forRoot(routes);