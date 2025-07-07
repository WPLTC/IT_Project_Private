# 🐳 Guide Docker – Démarrage Rapide

Ce guide explique comment démarrer le projet à partir du dépôt GitHub, configurer l'environnement, et lancer toute l'application avec Docker.

---

## 1. Cloner le projet

Commencez par cloner le dépôt sur votre PC :

```bash
git clone https://github.com/WPLTC/IT_Project_Private.git
cd IT_Project_Private
```

---

## 2. Créer le fichier `.env` pour le backend

Dans le dossier `backend/`, créez un fichier nommé `.env` et remplissez-le avec les variables d'environnement que je vous ai envoyées en privé (exemple : clés secrètes, paramètres de base de données, email, etc.).

Exemple de commande pour créer le fichier (sous Windows) :
```powershell
cd backend
.env
```
Collez-y les variables fournies, puis enregistrez.

---

## 3. Lancer Docker Desktop

Assurez-vous que Docker Desktop est bien lancé et en fonctionnement sur votre machine.

---

## 4. Construire et lancer les conteneurs

Revenez à la racine du projet (`IT_PROJECT_PRIVATE`) et exécutez :
pour démarrer toute l'application :

```bash
docker-compose up --build
```

- La première fois, cela peut prendre quelques minutes (installation des dépendances, import de la base, etc.).
- Attendez que tous les services soient bien démarrés (backend, frontend, db, redis).

---

## 5. Accéder à l’application

- **Frontend (React)** : [http://localhost:5173](http://localhost:5173)
- **Backend (Django API)** : [http://localhost:8000](http://localhost:8000)

---

## 6. Résumé

- Clonez le projet depuis GitHub
- Créez et remplissez le fichier `.env` dans `backend/`
- Lancez Docker Desktop
- Dans le terminal à la racine du projet, faites 'docker-compose up --build'
- L’application sera accessible et prête à l’emploi

---

**Pour toute question ou problème, consultez les logs avec :**
```bash
docker-compose logs
```
Voir les images:
docker images 

Voir les conteneurs lancé:
docker ps

Bonne utilisation ! 