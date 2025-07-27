<script lang="ts" setup>
// Définition des props attendues pour le composant
defineProps<{
  title: string;
  content?: string;
  image?: string;
  slug?: string;
  create_at: string;
  
}>();

// Fonction utilitaire pour formater la date
const formatDate = (date: string) => {
  return new Date(date).toLocaleDateString("en-US", {
    year: "numeric",
    month: "long",
    day: "numeric",
  });
};
</script>

<template>
  <div class="blog-card shadow-xl group overflow-hidden rounded">
    <!-- Image -->
    <div v-if="image" class="blog-card__image h-[180px] w-full relative overflow-hidden">
      <img
        :src="image"
        :alt="title"
        class="absolute w-full h-full object-cover duration-300 group-hover:scale-110"
      />
    </div>

    <!-- Contenu principal -->
    <div class="blog-card__content p-5">
      <h3 class="text-xl font-semibold mb-2">{{ title }}</h3>

      <p v-if="excerpt" class="text-sm text-clip overflow-hidden mb-2 line-clamp-3">
        {{ excerpt }}
      </p>

      <div class="flex items-center justify-between text-sm text-gray-500">
        <span>{{ formatDate(create_at) }}</span>
        <span v-if="slug" class="text-primary-500 cursor-pointer hover:underline">
          {{ slug }}
        </span>
      </div>
    </div>

    <!-- Lire la suite -->
    <div v-if="slug" class="blog-card__footer flex items-center justify-between p-5">
      <span class="text-primary-500 cursor-pointer hover:underline">{{ slug }}</span>
      
      <NuxtLink
        :to="`/${slug}`"
        class="inline-flex items-center text-primary-500 border-b-2 border-primary-500"
      >
        Read more
        <svg
          xmlns="http://www.w3.org/2000/svg"
          class="w-4 h-4 ml-1 duration-200 group-hover:ml-2"
          fill="none"
          viewBox="0 0 24 24"
          stroke-width="1.5"
          stroke="currentColor"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            d="M4.5 12h15m0 0l-6.75-6.75M19.5 12l-6.75 6.75"
          />
        </svg>
      </NuxtLink>
    </div>
  </div>
</template>
