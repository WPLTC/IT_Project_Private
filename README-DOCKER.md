# 🐳 Guide Docker – IT-PROJECT-PRIVATE

Ce document explique uniquement la partie Docker du projet (architecture, services, commandes utiles, bonnes pratiques).

---

## 1. Architecture Docker

Le projet utilise **Docker Compose** pour orchestrer plusieurs services :

- **backend** : Application Django (API REST)
- **frontend** : Application React (Vite)
- **db** : Base de données PostgreSQL
- **redis** : Service Redis (cache, ratelimit, etc.)

Chaque service a son propre Dockerfile (backend, frontend) ou utilise une image officielle (db, redis).

---

## 2. Rôle de chaque service

| Service   | Rôle principal                                 | Port local |
|-----------|------------------------------------------------|------------|
| backend   | API Django (Python)                            | 8000       |
| frontend  | Application React (Vite)                       | 5173       |
| db        | Base de données PostgreSQL                     | 5432       |
| redis     | Cache/ratelimit pour Django                    | 6379       |

---

## 3. Commandes Docker Compose utiles

### Lancer toute la stack (build + run)
```bash
docker-compose up --build
```

### Arrêter tous les services
```bash
docker-compose down
```

### Réinitialiser la base de données (supprimer les données)
```bash
docker-compose down -v
# puis
# docker-compose up --build
```

### Voir les logs d’un service
```bash
docker-compose logs backend
# ou
# docker-compose logs db
```

### Redémarrer un service
```bash
docker-compose restart backend
```

---

## 4. Initialisation de la base de données

- Le dossier `backend/db_init/` contient :
  - `dump.sql` : structure et données de la base
  - `patch_identity.sql` : correctifs d’auto-incrémentation (IDENTITY)
- Ces fichiers sont automatiquement importés au premier démarrage du conteneur `db`.

---

## 5. Bonnes pratiques Docker

- **Ne jamais modifier la base de données à la main dans le conteneur** : toujours passer par les dumps et patchs.
- **Pour ajouter des dépendances Python ou Node** : modifie `requirements.txt` ou `package.json` puis rebuild.
- **Pour tester en local** : tout se fait via Docker, aucune installation locale de Python, Node, PostgreSQL ou Redis n’est nécessaire.
- **Pour déployer ailleurs** : il suffit de copier le projet et de relancer `docker-compose up --build`.

---

## 6. Dépannage rapide

- Si le backend ne démarre pas tout de suite, il attend que la base soit prête (grâce à `wait-for-it.sh`).
- Si tu veux changer les ports ou variables d’environnement, modifie `docker-compose.yml`.
- Pour voir tous les logs :
  ```bash
  docker-compose logs
  ```

---

**Pour toute question sur Docker, consulte ce fichier ou le README principal.** 