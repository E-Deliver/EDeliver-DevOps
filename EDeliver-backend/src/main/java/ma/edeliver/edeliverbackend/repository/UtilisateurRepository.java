package ma.edeliver.edeliverbackend.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import ma.edeliver.edeliverbackend.entity.Utilisateur;

@Repository
public interface UtilisateurRepository extends JpaRepository<Utilisateur, Long> {
    // Recherche par email
    Optional<Utilisateur> findByEmail(String email);

  boolean existsByEmail(String email);
  long countByRole(Utilisateur.Role role); // Method to count users by role

  // Find users by their role
  List<Utilisateur> findByRole(Utilisateur.Role role);
}
