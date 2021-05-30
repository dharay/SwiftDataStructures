
open class BinaryTree<T:Equatable> {
    
}

open class BinaryTreeNode<T:Equatable> {
    var value: T
    var left: BinaryTreeNode<T>?
    var right: BinaryTreeNode<T>?
    init(value: T) {
        self.value = value
    }
}
