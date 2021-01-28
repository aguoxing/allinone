<template>
  <div>
    <div class="index-carousel">
      <Carousel v-model="value" autoplay :autoplay-speed="6000" loop>
        <CarouselItem>
          <div class="carousel">
            <div style="width: 100%;height: 200px;background-color: #FFFFCC;"></div>
          </div>
        </CarouselItem>
        <CarouselItem>
          <div class="carousel">
            <div style="width: 100%;height: 200px;background-color: #CCFFFF;"></div>
          </div>
        </CarouselItem>
        <CarouselItem>
          <div class="carousel">
            <div style="width: 100%;height: 200px;background-color: #FFCCCC;"></div>
          </div>
        </CarouselItem>
      </Carousel>
    </div>
    <!-- 文章列表 -->
    <ArticleList/>
  </div>
</template>

<script>
import ArticleList from '@/components/article/ArticleList'

export default {
  data() {
    return {
      value: 0
    }
  },
  components: {
    ArticleList
  }
}
</script>
