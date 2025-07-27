<script lang="ts" setup>
const params = useRoute().params;

const { data: posts } = await useFetch(`http://127.0.0.1:8000/art/articles/?slug_article=${params.slug}`);
const post = posts?.value?.[0];

const formatDate = (date: string) => {
  return new Date(date).toLocaleDateString("fr-FR", {
    year: "numeric",
    month: "long",
    day: "numeric",
  });
};

if (!post) {
  throw createError({
    statusCode: 404,
    statusMessage: "Article non trouvé",
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
  titleTemplate: "AGETIC Mali - %s",
});

const goBack = () => {
  if (window.history.length > 1) {
    window.history.back();
  } else {
    navigateTo('/actualites');
  }
};

// Formate le contenu et sécurise les liens
const formattedContent = computed(() => {
  if (!post?.content) return '';
  
  // Convertit les URLs brutes en liens cliquables
  const withLinks = post.content.replace(
    /(https?:\/\/[^\s]+)/g, 
    '<a href="$1" target="_blank" rel="noopener noreferrer">$1</a>'
  );
  
  return withLinks
    .replace(/\n\n+/g, '</p><p>')
    .replace(/\n/g, '<br>');
});

// Gère les clics sur les liens dans le contenu
const handleContentClick = (e: MouseEvent) => {
  const target = e.target as HTMLElement;
  if (target.tagName === 'A') {
    const href = target.getAttribute('href');
    if (href && href.startsWith('http')) {
      e.preventDefault();
      window.open(href, '_blank', 'noopener,noreferrer');
    }
  }
};
</script>

<template>
  <section class="container blog py-6 sm:py-10">
    <button 
    @click="goBack"
    class="flex items-center gap-2 text-[#008080] hover:text-[#006666] mb-6 transition-colors duration-200"
  >
    <Icon name="heroicons:arrow-left-20-solid" class="text-xl" />
    <span class="font-medium">Retour</span>
  </button>

    <div v-if="post" class="sm:px-10">
      <h1 class="text-2xl sm:text-4xl font-bold mb-4">
        {{ post.titre_article }}
      </h1>

      <div class="flex flex-col sm:flex-row mb-6 gap-3 text-sm">
        <span>
          Auteur :
          <span class="text-[#008080]">
            {{ post.auteur ? post.auteur.email : 'Auteur inconnu' }}
          </span>
        </span>
        <span>
          Publié le :
          <span class="text-[#008080]">
            {{ formatDate(post.created_at) }}
          </span>
        </span>
      </div>

      <div v-if="post.image_article" class="h-[200px] sm:h-[400px] mb-8 rounded-lg overflow-hidden">
        <img
          :src="post.image_article"
          :alt="post.titre_article"
          class="w-full h-full object-cover"
        />
      </div>

      <div 
        class="blog__content" 
        v-html="formattedContent"
        @click="handleContentClick"
      ></div>
    </div>
  </section>
</template>

<style>
.blog__content {
  line-height: 1.5;
}

.blog__content p {
  margin-bottom: 1em;
}

.blog__content br {
  content: "";
  display: block;
  margin-bottom: 0.5em;
}

.blog__content a {
  color: #0066cc;
  text-decoration: underline;
  word-break: break-all;
}

.blog__content a:hover {
  color: #004499;
  text-decoration: none;
}

.blog__content h1 {
  font-size: 1.5rem;
  font-weight: bold;
  margin: 1.25em 0 0.75em;
}
.blog__content h2 {
  font-size: 1.3rem;
  font-weight: bold;
  margin: 1em 0 0.6em;
}
.blog__content h3 {
  font-size: 1.1rem;
  font-weight: bold;
  margin: 0.8em 0 0.5em;
}

.blog__content ul,
.blog__content ol {
  padding-left: 1.5em;
  margin: 0.8em 0;
}
.blog__content li {
  margin-bottom: 0.3em;
}

.blog__content blockquote {
  border-left: 3px solid #008080;
  padding-left: 1em;
  margin: 1em 0;
  font-style: italic;
}
</style>