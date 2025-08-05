<script lang="ts" setup>
import colorGenerator from "~~/utils/colorGenerator";
const baseUrl = "/api/ctg/categories/";

// Configuration du head de la page
useHead({
  title: "Catégories",
  meta: [
    {
      name: "description",
      content: "Explorez toutes les catégories d'actualités de l'AGETIC Mali"
    }
  ],
  titleTemplate: "AGETIC Mali - %s"
});

// Récupération des catégories
const { data: categories } = await useFetch(baseUrl);
</script>

<template>
  <div>
    <!-- En-tête de page -->
    <PageHeader title="Catégories" />
    
    <!-- Section principale des catégories -->
    <section class="py-12 bg-gray-50">
      <div class="container mx-auto px-4 sm:px-6 lg:px-8">
        <!-- Grille des catégories -->
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
          <!-- Carte de catégorie -->
          <NuxtLink
            v-for="category in categories"
            :key="category.id"
            :to="`/categories/${category.slug_ctg}`"
            class="group flex items-center justify-center p-6 rounded-xl shadow-sm bg-teal-600 hover:bg-teal-700  transition-all duration-300"
          >
            <div class="text-center">
              <!-- Nom de la catégorie -->
              <h3 class="text-xl font-semibold text-white group-hover:text-teal-100 transition-colors">
                {{ category.nom_ctg }}
              </h3>
              
              <!-- Badge indicateur -->
              <div class="mt-2 inline-flex items-center px-3 py-1 rounded-full text-xs font-medium bg-white/20 text-white">
                Explorer →
              </div>
            </div>
          </NuxtLink>
        </div>
      </div>
    </section>
  </div>
</template>

<style scoped>
/* Animation améliorée */
.group {
  transition: transform 0.3s ease, background-color 0.3s ease, box-shadow 0.3s ease;
}

.group:hover {
  transform: translateY(-4px);
  box-shadow: 0 10px 20px rgba(0, 128, 128, 0.15);
}
</style>