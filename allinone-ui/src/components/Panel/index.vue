<template>
  <div class="right-panel">
    <div class="mobile-card">
      <InfoPanel/>
    </div>
    <RecommendPanel/>
    <TagPanel/>
    <FriendLink/>
  </div>
</template>

<script>
import InfoPanel from './InfoPanel'
import RecommendPanel from './RecommendPanel'
import TagPanel from './TagPanel'
import FriendLink from './FriendLinkPanel'

export default {
  components: {
    InfoPanel,
    RecommendPanel,
    TagPanel,
    FriendLink
  },
}
</script>

<style>

</style>
