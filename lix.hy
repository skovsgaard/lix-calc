(defn lixer [word-count periods long-words]
  (+ (/ word-count periods)
     (/ (* long-words 100) word-count)))

(defn take-words [text]
  (.split text " "))

(defn take-periods [text]
  (.split text ". "))

(defn take-lwords [text]
  (-> (filter
        (fn [word] (> (len (.strip word ".")) 6))
          (take-words text))
      list))

(defn count-words [words]
  (len words))

(defn count-periods [sentences]
  (if (<= 1 (len sentences))
      1
      (len sentences)))

(defn count-lwords [lwords]
  (len lwords))

(defmain [&rest args]
  (let [[text (nth args 1)]]
    (let [[wordcount (-> text take-words count-words)]
          [periodcount (-> text take-periods count-periods)]
          [lwordcount (-> text take-lwords count-lwords)]]
      (print (+ "LIX count is "
        (str (lixer wordcount periodcount lwordcount)))))))
