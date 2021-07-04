<template>
  <div>
    <Header :numCorrect="numCorrect" :numTotal="numTotal" />
    <div class="container">
      <div class="row">
        <div class="col-sm-6 offset-sm-3">
          <QuestionBox
            v-if="questions.length"
            :currentQuestion="questions[index]"
            :next="next"
            :prev="prev"
            :increment="increment"
          />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Header from "./components/Header.vue";
import QuestionBox from "./components/QuestionBox.vue";

export default {
  name: "App",
  components: {
    Header,
    QuestionBox,
  },
  data() {
    return {
      questions: [],
      index: 0,
      numCorrect: 0,
      numTotal: 0,
    };
  },
  methods: {
    next() {
      if (this.index < 10) {
        this.index++;
      }
    },
    prev() {
      if (this.index) {
        this.index--;
      }
    },
    increment(isCorrect) {
      if (isCorrect) {
        this.numCorrect++;
      }
      this.numTotal++;
    },
  },
  mounted: function() {
    fetch("https://opentdb.com/api.php?amount=10", {
      method: "get",
    }).then((res) => {
      res.json().then((data) => {
        console.log(data);
        this.questions = data.results;
      });
    });
  },
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
