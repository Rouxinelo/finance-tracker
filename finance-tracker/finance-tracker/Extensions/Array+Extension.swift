extension Array {
    func subarrays(size: Int) -> [[Element]] {
        guard size > 0, size <= count else { return [] }
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}
