package ma.edeliver.edeliverbackend.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ma.edeliver.edeliverbackend.entity.Livreur;

@Repository
public interface LivreurRepository extends JpaRepository<Livreur, Long> {

    // Find all livreurs that are available (EtatLivreur.DISPONIBLE)
    List<Livreur> findByEtat(Livreur.EtatLivreur etat);
}
