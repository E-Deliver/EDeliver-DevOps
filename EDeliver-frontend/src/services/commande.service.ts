import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { AuthService } from './auth.service';  // Import your AuthService

@Injectable({
  providedIn: 'root'
})
export class CommandeService {
  private commandesUrl = 'http://localhost:9090/api/commandes';  // Your backend API URL

  constructor(private http: HttpClient, private authService: AuthService) { }

  // Method to retrieve all commandes
  getCommandes(): Observable<any[]> {
    const token = this.authService.getToken(); 
    console.log(token) ;// Retrieve the stored auth token
    const headers = new HttpHeaders({
      'Authorization': `Bearer ${token}`,
      'Content-Type': 'application/json',  // Include the token in the header
    });
    return this.http.get<any[]>(this.commandesUrl, { headers });
  }

  // Ajouter cette méthode dans le service
  /*assignerLivreur(commandeId: number, livreurId: number): Observable<any> {
    return this.http.post(`${this.commandesUrl}/commandes/${commandeId}/assigner-livreur`, { livreurId });
  }*/

    assignerLivreur(commandeId: number, livreurId: number): Observable<any> {
      const token = this.authService.getToken();
      const headers = new HttpHeaders({
        'Authorization': `Bearer ${token}`,
        'Content-Type': 'application/json',
      });
      return this.http.put(`${this.commandesUrl}/${commandeId}/assigner/${livreurId}`, {}, { headers });
    }     

    getCommandesByLivreurId(livreurId: number): Observable<any[]> {
      const token = this.authService.getToken();  // Assurez-vous d'avoir le token
      const headers = new HttpHeaders({
        'Authorization': `Bearer ${token}`,
        'Content-Type': 'application/json',
      });
      return this.http.get<any[]>(`${this.commandesUrl}/livreur/${livreurId}`, { headers });
    }

    updateCommandeStatus(idCommande: number, newStatus: string): Observable<any> {
      return this.http.put(`${this.commandesUrl}/${idCommande}`, { statut: newStatus });
    }

      updateCommandeStatut(idCommande: number, newStatus: string): Observable<any> {
        const token = this.authService.getToken();
        const headers = new HttpHeaders({
          'Authorization': `Bearer ${token}`,
          'Content-Type': 'application/json',
        });
        return this.http.put(`${this.commandesUrl}/${idCommande}/status`, { statut: newStatus }, { headers });
      }
      
      getCommandesByClientIdAndStatus(clientId: number, statut: string): Observable<any[]> {
        const token = this.authService.getToken();
        const headers = new HttpHeaders({
            'Authorization': `Bearer ${token}`,
            'Content-Type': 'application/json',
        });
        return this.http.get<any[]>(`${this.commandesUrl}/client/${clientId}/status/${statut}`, { headers });
    } 
    
    getCommandesByClientIdAndStatut(clientId: number, statut: string): Observable<any[]> {
      const token = this.authService.getToken();
      const headers = new HttpHeaders({
          'Authorization': `Bearer ${token}`,
          'Content-Type': 'application/json',
      });
      return this.http.get<any[]>(`${this.commandesUrl}/client/${clientId}/status/${statut}`, { headers });
  } 
    
}