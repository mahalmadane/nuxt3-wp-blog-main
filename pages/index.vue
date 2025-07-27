<script lang="ts" setup>
// Configuration du head
useHead({
  title: "Accueil",
  meta: [{ name: "description", content: "Portail d'actualités de l'AGETIC Mali" }],
  titleTemplate: "AGETIC Mali - %s",
});

// Récupération des articles avec useFetch
const { data: blogs, pending, error, refresh } = await useFetch(
  'http://127.0.0.1:8000/art/articles/?statue=publie&ordering=-created_at',
  {
    transform: (data: any[]) => {
      return data.map(article => ({
        ...article,
        excerpt: article.content.substring(0, 150) + '...'
      }))
    }
  }
)

// Fonction de formatage de date
const formatDate = (dateString: string) => {
  return new Date(dateString).toLocaleDateString('fr-ML', {
    year: 'numeric',
    month: 'long',
    day: 'numeric'
  })
}
</script>

<template>
  <main class="bg-[#f5f5f5] min-h-screen">
    <!-- En-tête institutionnel -->
    <header class="bg-gradient-to-r from-[#008080] to-[#008080] text-white py-12">
      <div class="container mx-auto px-4 flex flex-col md:flex-row items-center">
        <!-- Logo AGETIC -->
        <div class="w-40 h-40 md:w-48 md:h-48 bg-white rounded-full p-2 mb-6 md:mb-0 md:mr-10 shadow-lg">
          <img
            src="/assets/images/logoAgetic.png"
            alt="Logo AGETIC Mali"
            class="w-full h-full object-contain"
          />
        </div>

        <div class="text-center md:text-left">
          <h1 class="text-2xl md:text-3xl font-bold mb-3">Agence des Technologies de l'Information et de la Communication</h1>
          <p class="text-lg mb-4">Innovation numérique au service du développement du Mali</p>
          <div class="flex flex-wrap justify-center md:justify-start gap-3">
            <NuxtLink 
              to="#actualites" 
              class="bg-white text-[#008080] hover:bg-[#f5f5f5] px-5 py-2 rounded-lg font-medium flex items-center gap-1"
            >
              <Icon name="mdi:newspaper" class="text-lg" />
              Actualités
            </NuxtLink>
            <a 
              href="https://www.agetic.gov.ml" 
              target="_blank"
              class="border border-white hover:bg-white hover:text-[#008080] px-5 py-2 rounded-lg font-medium flex items-center gap-1"
            >
              <Icon name="mdi:web" class="text-lg" />
              Site officiel
            </a>
          </div>
        </div>
      </div>
    </header>

    <!-- Section Actualités -->
    <section id="actualites" class="py-16 container mx-auto px-4">
      <div class="text-center mb-12">
        <h2 class="text-3xl font-bold text-[#1a1a1a] mb-3">Actualités récentes</h2>
        <div class="w-20 h-1 bg-[#eab308] mx-auto"></div>
      </div>

      <!-- États de chargement -->
      <div v-if="pending" class="grid place-items-center py-12">
        <div class="flex flex-col items-center">
          <Icon name="eos-icons:loading" class="text-4xl text-[#008080] mb-2" />
          <p>Chargement des actualités...</p>
        </div>
      </div>

      <!-- Gestion des erreurs -->
      <div v-else-if="error" class="bg-red-50 border-l-4 border-red-500 p-4 mb-8">
        <div class="flex items-center">
          <Icon name="mdi:alert-circle" class="text-red-500 text-xl mr-2" />
          <p class="text-red-700">Erreur lors du chargement : {{ error.message }}</p>
        </div>
        <button 
          @click="refresh"
          class="mt-2 text-sm bg-red-100 hover:bg-red-200 text-red-800 px-3 py-1 rounded"
        >
          <Icon name="mdi:reload" class="mr-1" />
          Réessayer
        </button>
      </div>

      <!-- Affichage des articles -->
      <div v-else class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
        <article 
          v-for="blog in blogs" 
          :key="blog.id"
          class="bg-white rounded-lg overflow-hidden shadow-md hover:shadow-lg transition-shadow border border-[#f5f5f5]"
        >
          <!-- Image de l'article -->
          <div class="relative h-48 w-full overflow-hidden">
            <img
              :src="blog.image_article || '/placeholder-news.jpg'"
              :alt="blog.titre_article"
              class="w-full h-full object-cover hover:scale-105 transition-transform duration-300"
            />
            <!-- Badge catégorie -->
            <span 
              v-if="blog.categorie"
              class="absolute top-3 left-3 bg-[#008080] text-white text-xs px-3 py-1 rounded-full"
            >
              {{ blog.categorie.nom_ctg }}
            </span>
          </div>

          <!-- Contenu -->
          <div class="p-5">
            <!-- Métadonnées -->
            <div class="flex items-center text-sm text-gray-500 mb-3">
              <Icon name="mdi:calendar" class="mr-1" />
              <time :datetime="blog.created_at">{{ formatDate(blog.created_at) }}</time>
            </div>

            <!-- Titre -->
            <h3 class="text-xl font-bold mb-3 text-[#1a1a1a] line-clamp-2">
              <NuxtLink :to="`/actualites/${blog.slug_article}`" class="hover:underline">
                {{ blog.titre_article }}
              </NuxtLink>
            </h3>

            <!-- Extrait -->
            <p class="text-gray-600 mb-4 line-clamp-3 content">{{ blog.excerpt }}</p>

            <!-- Lien vers l'article -->
            <NuxtLink 
              :to="`${blog.slug_article}`"
              class="inline-flex items-center text-[#008080] font-medium hover:text-[#1a1a1a] group"
            >
              Lire la suite
              <Icon 
                name="mdi:arrow-right" 
                class="ml-1 group-hover:ml-2 transition-all" 
              />
            </NuxtLink>
          </div>
        </article>
      </div>
    </section>

    <!-- Section Newsletter -->
    <section class="bg-[#f5f5f5] py-12">
      <div class="container mx-auto px-4 max-w-4xl">
        <div class="bg-white rounded-lg shadow-sm p-8 md:p-10 text-center">
          <Icon name="mdi:email-newsletter" class="text-4xl text-[#008080] mb-4 mx-auto" />
          <h3 class="text-2xl font-bold text-[#1a1a1a] mb-3">Abonnez-vous à notre newsletter</h3>
          <p class="text-gray-600 mb-6">Recevez les dernières actualités de l'AGETIC directement dans votre boîte mail.</p>
          
          <form class="flex flex-col sm:flex-row gap-3 max-w-md mx-auto">
            <input 
              type="email" 
              placeholder="Votre email professionnel" 
              class="flex-grow px-4 py-3 rounded-lg border border-[#f5f5f5] focus:ring-2 focus:ring-[#008080] focus:border-transparent"
              required
            >
            <button 
              type="submit" 
              class="bg-[#008080] hover:bg-[#006666] text-white px-6 py-3 rounded-lg font-medium whitespace-nowrap"
            >
              S'abonner
            </button>
          </form>
        </div>
      </div>
    </section>
  </main>
</template>

<style scoped>
.line-clamp-2 {
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

.line-clamp-3 {
  display: -webkit-box;
  -webkit-line-clamp: 3;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

.content {
  color: #1a1a1a;
  font-size: 0.9375rem;
  line-height: 1.5;
  opacity: 0.9;
}
</style>