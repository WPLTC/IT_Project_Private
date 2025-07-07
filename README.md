# 📝 Projet : Plateforme de Blog avec Authentification Sécurisée

## 📌 Description

Ce projet est une application web permettant aux utilisateurs de créer, lire, commenter et réagir à des posts, avec un système d’authentification sécurisé.  
Le backend est construit avec **Django REST Framework** et utilise une authentification via `refresh_token` stocké dans des cookies HTTP-only.  
Le frontend est développé avec **React**, avec un `AuthContext` pour gérer l’état utilisateur.

---

## ✅ Fonctionnalités Implémentées

### Backend (Django REST Framework)
- Gestion des utilisateurs : inscription, connexion, déconnexion, réinitialisation de mot de passe (via email).
- Gestion des posts : création, mise à jour, suppression, consultation.
- Commentaires et réactions (LIKE, LOVE, etc.).
- Système de tags.
- Authentification sécurisée avec `refresh_token`.
- Protection par rate limiting.
- Caching avec Redis.

### Frontend (React)
- Interfaces : inscription, connexion, mot de passe oublié.
- Création, affichage et gestion des posts.
- Ajout de commentaires et réactions.
- Gestion d’état global via `AuthContext`.

---

## 🏗️ Architecture

- **Backend** : Django REST Framework + PostgreSQL + Redis + SMTP (email)
- **Frontend** : React + Axios + Context API
- **API** : REST (HTTP/JSON)

---

## 🔧 Prérequis

### Backend
- Python 3.8+
- PostgreSQL 15+
- Redis 7+
- Un compte Gmail (ou autre SMTP)

### Frontend
- Node.js 16+
- npm ou yarn

---

## 🚀 Installation

### 1. Cloner le Dépôt

```bash
git clone https://github.com/votre-utilisateur/votre-projet.git
cd votre-projet
````

---

### 2. Configurer le Backend

#### a. Environnement virtuel

```bash
cd backend
python -m venv venv
source venv/bin/activate  # (Windows: venv\Scripts\activate)
pip install -r requirements.txt
```

#### b. Fichier `.env`

```env
# backend/.env
SECRET_KEY=your-secret-key
DEBUG=True
ALLOWED_HOSTS=localhost,127.0.0.1

DATABASE_URL=psql://user:password@localhost:5432/db_name
REDIS_URL=redis://localhost:6379/0

EMAIL_HOST=smtp.gmail.com
EMAIL_PORT=587
EMAIL_USE_TLS=True
EMAIL_HOST_USER=votre.email@gmail.com
EMAIL_HOST_PASSWORD=votre-app-password
DEFAULT_FROM_EMAIL=votre.email@gmail.com
```

#### c. Migrations

```bash
python manage.py makemigrations
python manage.py migrate
```

#### d. Créer un superutilisateur

```bash
python manage.py createsuperuser
```

#### e. Lancer le serveur

```bash
python manage.py runserver
# accessible via http://localhost:8000
```

---

### 3. Configurer le Frontend

#### a. Installer les dépendances

```bash
cd frontend
npm install
```

#### b. Fichier `.env`

```env
# frontend/.env
REACT_APP_API_URL=http://localhost:8000/api/
```

#### c. Lancer le frontend

```bash
npm start
# accessible via http://localhost:3000
```

---

## 💻 Utilisation

* Frontend : [http://localhost:3000](http://localhost:3000)
* Backend Admin : [http://localhost:8000/admin/](http://localhost:8000/admin/)
* API : [http://localhost:8000/api/](http://localhost:8000/api/)

### Exemples d’Endpoints

* `GET /api/posts/` : liste des posts
* `POST /api/login/` : connexion (avec `refresh_token`)
* `POST /api/password/reset/` : demande de réinitialisation de mot de passe

---

## 🗂️ Structure des Fichiers

### Backend

```
backend/
├── manage.py
├── project/
│   ├── settings.py, urls.py, wsgi.py
├── users/
│   ├── models.py, serializers.py, views.py, urls.py
├── posts/
│   ├── models.py, views.py, urls.py, permissions.py
├── requirements.txt
```

### Frontend

```
frontend/
├── public/
├── src/
│   ├── components/, context/, pages/ ,services/, utils/
│   ├── App.js, index.js
├── .env
├── package.json
```

---

## 🤝 Contribution

1. Forkez le repo
2. Créez une branche : `git checkout -b feature/ma-feature`
3. Commitez : `git commit -m "Ajout de X"`
4. Poussez : `git push origin feature/ma-feature`
5. Créez une Pull Request

---

## 🧪 Tests

### Backend

```bash
python manage.py test
```

### Frontend

Tests non encore implémentés — recommandés avec **Jest** et **React Testing Library**.

---

## 📈 Prochaines Étapes

* [ ] Ajouter la pagination
* [ ] Écrire des tests frontend
* [ ] Déployer en production (HTTPS, CI/CD)
* [ ] Utiliser un service email professionnel (ex. SendGrid)

---

## 📄 Licence

Ce projet est sous licence **MIT**. Voir le fichier `LICENSE`.

---

## 🙏 Remerciements

* Django, Django REST Framework
* React & communauté open-source
* Merci à vous d’utiliser ce projet !


# 🚀 Démarrage rapide du projet Dockerisé

## Prérequis
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) installé (Windows, Mac, Linux)
- (Optionnel) [Git](https://git-scm.com/) pour cloner le projet

## 1. Récupérer le projet

Clone ce dépôt ou récupère le dossier du projet (avec tous les fichiers Docker, backend, frontend, et le dossier `backend/db_init/` contenant `dump.sql` et `patch_identity.sql`).

```bash
# Exemple avec git
# git clone <url-du-repo>
cd IT-PROJECT-PRIVATE
```

## 2. Lancer toute la stack (backend, frontend, base de données, redis)

Dans le dossier racine du projet (là où se trouve `docker-compose.yml`) :

```bash
docker-compose up --build
```

- La première fois, cela peut prendre quelques minutes (installation des dépendances, import de la base, etc.).
- **Attends que tous les services soient bien démarrés** (tu verras dans les logs que le backend, le frontend, la base et redis sont tous "ready").

## 3. Accéder à l’application

- **Frontend (React)** : [http://localhost:5173](http://localhost:5173)
- **Backend (Django API)** : [http://localhost:8000](http://localhost:8000) (ou selon la config)

## 4. Fonctionnalités disponibles
- Inscription / Connexion
- Création de posts, commentaires, likes, etc.
- Toutes les données de test sont déjà importées

## 5. Réinitialiser la base de données (optionnel)
Si tu veux repartir de zéro (réimporter le dump) :
```bash
docker-compose down -v
# puis
docker-compose up --build
```

## 6. Arrêter tous les services
```bash
docker-compose down
```

## 7. Problèmes fréquents
- Si le backend ne démarre pas tout de suite, il attend que la base soit prête (c’est normal !).
- Si tu veux changer des variables d’environnement (ports, mots de passe…), modifie le fichier `docker-compose.yml`.

---

**Bon démarrage !**

Pour toute question, contacte l’auteur du projet ou regarde les logs avec :
```bash
docker-compose logs
```


