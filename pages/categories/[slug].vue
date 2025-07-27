<script lang="ts" setup>
const params = useRoute().params;
const baseUrl = "http://127.0.0.1:8000/ctg/categories/";

const { data: categories, error } = await useFetch(`${baseUrl}?slug_ctg=${params.slug}`)
if (!categories.value || categories.value.length === 0) {
  throw createError({
    statusCode: 404,
    statusMessage: "Catégorie non trouvée",
  });
}

const category = categories.value[0];

// Récupération des articles
const { data: posts, error: postsError } = await useFetch(
  `http://127.0.0.1:8000/art/articles/?categorie__slug_ctg=${category.slug_ctg}`,
  {
    transform: (data: any[]) => {
      return data.map(article => ({
        ...article,
        excerpt: article.content.substring(0, 150) + '...'
      }))
    }
  }
);

// Formatage de date
const formatDate = (dateString: string) => {
  return new Date(dateString).toLocaleDateString('fr-ML', {
    year: 'numeric',
    month: 'long',
    day: 'numeric'
  })
}

useHead({
  title: `Catégorie : ${category.nom_ctg}`,
  meta: [
    {
      name: "description",
      content: `Articles de la catégorie ${category.nom_ctg}`,
    },
  ],
  titleTemplate: "AGETIC Mali - %s",
});
</script>

<template>
  <div class="bg-gray-50 min-h-screen">
    <!-- En-tête avec bouton Retour -->
    <div class="bg-[#008080] text-white py-6">
      <div class="container mx-auto px-4 flex justify-between items-center">
        <h1 class="text-2xl font-bold">Catégorie : {{ category.nom_ctg }}</h1>
        <NuxtLink 
          to="/categories" 
          class="flex items-center gap-2 bg-white hover:bg-gray-100 text-[#008080] px-4 py-2 rounded-lg transition-colors duration-200"
        >
          <Icon name="mdi:arrow-left" class="text-lg" />
          <span>Retour aux catégories</span>
        </NuxtLink>
      </div>
    </div>

    <!-- Section Articles -->
    <section class="py-16 container mx-auto px-4">
      <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
        <article 
          v-for="post in posts" 
          :key="post.id"
          class="bg-white rounded-lg overflow-hidden shadow-md hover:shadow-lg transition-shadow border border-gray-100"
        >
          <!-- Image de l'article -->
          <div class="relative h-48 w-full overflow-hidden">
            <img
              :src="post.image_article || '/placeholder-news.jpg'"
              :alt="post.titre_article"
              class="w-full h-full object-cover hover:scale-105 transition-transform duration-300"
            />
            <!-- Badge catégorie -->
            <span class="absolute top-3 left-3 bg-[#008080] text-white text-xs px-3 py-1 rounded-full">
              {{ category.nom_ctg }}
            </span>
          </div>

          <!-- Contenu -->
          <div class="p-5">
            <!-- Métadonnées -->
            <div class="flex items-center text-sm text-gray-500 mb-3">
              <Icon name="mdi:calendar" class="mr-1" />
              <time :datetime="post.created_at">{{ formatDate(post.created_at) }}</time>
            </div>

            <!-- Titre -->
            <h3 class="text-xl font-bold mb-3 text-[#1a1a1a] line-clamp-2">
              <NuxtLink :to="`/actualites/${post.slug_article}`" class="hover:underline">
                {{ post.titre_article }}
              </NuxtLink>
            </h3>

            <!-- Extrait -->
            <p class="text-gray-600 mb-4 line-clamp-3">{{ post.excerpt }}</p>

            <!-- Lien vers l'article -->
            <NuxtLink 
              :to="`/${post.slug_article}`"
              class="inline-flex items-center text-[#008080] font-medium hover:text-[#006666] group"
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
  </div>
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
</style>