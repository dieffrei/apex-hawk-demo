public inherited sharing class QueryResultIterator implements Iterator<IEntity> {

    private Integer currentIndex;
    private List<IEntity> entities;

    public QueryResultIterator(List<IEntity> entities){
        this.entities = entities;
    }

    public Boolean hasNext(){
        return currentIndex < entities.size() - 1;
    }

    public IEntity next(){
        if(hasNext()) {
            currentIndex++;
            return entities[currentIndex];
        } else {
            throw new NoSuchElementException();
        }
    }

}
