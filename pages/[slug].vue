<script lang="ts" setup>
const params = useRoute().params;

const { data: posts } = await useFetch(`http://127.0.0.1:8000/art/articles/?slug_article=${params.slug}`);
const post = posts?.value?.[0];

const formatDate = (date: string) => {
  return new Date(date).toLocaleDateString("en-US", {
    year: "numeric",
    month: "long",
    day: "numeric",
  });
};

if (!post) {
  throw createError({
    statusCode: 404,
    statusMessage: "Article not found",
  });
}

useHead({
  title: post?.titre_article,
  meta: [
    {
      name: "description",
      content: post?.content
        ? post.content.slice(0, 150) + "..."
        : "Article",
    },
  ],
});

// Fonction pour retourner à la page précédente
const goBack = () => {
  if (window.history.length > 1) {
    window.history.back();
  } else {
    navigateTo('/actualites'); // Fallback si pas d'historique
  }
};
</script>

<template>
  <section class="container blog py-10 sm:py-16">
    <!-- Bouton de retour -->
    <button 
      @click="goBack"
      class="flex items-center gap-2 text-[#008080] hover:text-[#006666] mb-8 transition-colors duration-200"
    >
      <Icon name="mdi:arrow-left" class="text-2xl" />
      <span class="font-medium">Retour</span>
    </button>

    <div v-if="post" class="sm:px-20">
      <!-- Blog Title -->
      <h1 class="blog__title text-3xl sm:text-5xl font-bold text-center leading-snug mb-5">
        {{ post.titre_article }}
      </h1>

      <!-- Blog Meta -->
      <div class="flex mb-10 justify-center gap-5">
        <span>
          Written by:
          <span class="text-primary-500">
            {{ post.auteur ? post.auteur.email : 'Unknown Author' }}
          </span>
        </span>

        <span>
          Published on:
          <span class="text-primary-500">
            {{ formatDate(post.created_at) }}
          </span>
        </span>
      </div>

      <!-- Blog Image -->
      <div class="blog__image h-[250px] sm:h-[500px] w-full rounded shadow-xl relative overflow-hidden mb-12">
        <img
          :src="post.image_article"
          :alt="post.titre_article"
          class="absolute w-full h-full object-cover"
        />
      </div>

      <!-- Blog Content -->
      <div class="blog__content" v-if="post.content">
        <div v-html="post.content"></div>
      </div>
    </div>
  </section>
</template>

<style>
.blog__content {
  @apply sm:px-10;
}
.blog__content h1,
.blog__content h2,
.blog__content h3,
.blog__content h4,
.blog__content h5,
.blog__content h6,
.blog__content p {
  @apply my-5;
}
.blog__content h1 {
  @apply text-2xl sm:text-4xl font-bold;
}
.blog__content h2 {
  @apply text-xl sm:text-3xl font-bold;
}
.blog__content h3 {
  @apply text-lg sm:text-2xl font-bold;
}
.blog__content h4 {
  @apply sm:text-xl font-bold;
}
.blog__content h5 {
  @apply text-sm sm:text-lg font-bold;
}
</style>