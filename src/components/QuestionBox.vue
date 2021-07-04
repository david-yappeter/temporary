<template>
  <div class="jumbotron">
    <h1 class="display-4"></h1>
    <p class="lead">
      {{ currentQuestion.question }}
    </p>
    <hr class="my-4" />
    <div class="container">
      <ul class="list-group">
        <li
          class="list-group-item list-group-item-action"
          v-for="(answer, index) in shuffledAnswers"
          :key="index"
          @click.prevent="selectAnswer(index)"
          :class="[
            !answered && selectedIndex === index
              ? 'selected-item'
              : answered && correctIndex === index
              ? 'correct'
              : answered && selectedIndex === index && correctIndex !== index
              ? 'incorrect'
              : '',
          ]"
        >
          {{ answer }}
        </li>
      </ul>
    </div>
    <div class="lead button-container">
      <button
        @click.prevent="prev"
        class="btn btn-success btn-lg"
        href="#"
        role="button"
      >
        Previous
      </button>
      <button
        @click.prevent="submitAnswer"
        class="btn btn-primary btn-lg"
        :disabled="selectedIndex === null || answered"
        href="#"
        role="button"
      >
        Submit
      </button>
      <button
        @click.prevent="next"
        class="btn btn-success btn-lg"
        href="#"
        role="button"
      >
        Next
      </button>
    </div>
  </div>
</template>

<script>
import _ from "lodash";

export default {
  data() {
    return {
      answered: false,
      selectedIndex: null,
      correctIndex: null,
      shuffledAnswers: [],
    };
  },
  props: {
    currentQuestion: Object,
    next: Function,
    prev: Function,
    increment: Function,
  },
  computed: {
    answers() {
      let answers = [...this.currentQuestion.incorrect_answers];
      answers.push(this.currentQuestion.correct_answer);
      return answers;
    },
  },
  methods: {
    selectAnswer(index) {
      this.selectedIndex = index;
    },
    shuffleAnswers() {
      let answers = [
        ...this.currentQuestion.incorrect_answers,
        this.currentQuestion.correct_answer,
      ];
      this.shuffledAnswers = _.shuffle(answers);
      this.correctIndex = this.shuffledAnswers.indexOf(
        this.currentQuestion.correct_answer
      );
      this.answered = false;
    },
    submitAnswer() {
      let isCorrect = false;
      if (this.selectedIndex === this.correctIndex) {
        isCorrect = true;
      }
      this.answered = true;
      this.increment(isCorrect);
    },
  },
  watch: {
    currentQuestion: {
      immediate: true,
      handler() {
        this.selectedIndex = null;
        this.shuffleAnswers();
      },
    },
  },
};
</script>

<style scoped>
.button-container {
  margin-top: 50px;
  display: flex;
  justify-content: space-around;
}

.list-group-item-action {
  cursor: pointer;
}

.selected-item {
  color: white;
  background-color: rgb(0, 73, 207);
}

.correct {
  background-color: rgb(36, 250, 36);
}

.incorrect {
  background-color: rgb(221, 38, 38);
}
</style>
