<template>
  <div class="right-panel">
    <RecommendPanel/>
    <TagPanel/>
  </div>
</template>

<script>
import RecommendPanel from '@/components/Panel/RecommendPanel';
import TagPanel from '@/components/Panel/TagPanel';

export default {
  components: {
    RecommendPanel,
    TagPanel
  },
}
</script>

<style>
</style>
