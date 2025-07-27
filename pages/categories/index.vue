<script lang="ts" setup>
import colorGenerator from "~~/utils/colorGenerator";
const baseUrl = "http://127.0.0.1:8000/ctg/categories/"
useHead({
  title: "Catégories",
  meta: [
    {
      name: "description",
      content: "Toutes les catégories d'actualités de l'AGETIC Mali",
    },
  ],
  titleTemplate: "AGETIC Mali - %s",
});

const { data: categories } = await useFetch(`${baseUrl}`);
</script>

<template>
  <PageHeader title="Catégories"> </PageHeader>
  <section class="py-10 bg-[#f5f5f5]">
    <div class="container">
      <div class="flex flex-wrap gap-4">
        <NuxtLink
          v-for="category in categories"
          :key="(category as any).id"
          :to="`/categories/${(category as any).slug_ctg}`"
          class="flex items-center justify-center py-3 px-6 rounded-lg text-white shadow-md hover:shadow-lg transition-all duration-300 text-xl font-medium"
          :style="{ backgroundColor: '#008080' }"
        >
          <span class="font-semibold">{{ (category as any).nom_ctg }}</span>
        </NuxtLink>
      </div>
    </div>
  </section>
</template>

<style scoped>
/* Animation au survol */
a {
  transform: translateY(0);
  transition: transform 0.2s ease, box-shadow 0.2s ease;
}

a:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}
</style>